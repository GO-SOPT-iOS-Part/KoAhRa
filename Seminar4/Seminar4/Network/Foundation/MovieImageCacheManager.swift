//
//  MovieImageCacheManager.swift
//  Seminar4
//
//  Created by 고아라 on 2023/05/12.
//

import UIKit

enum ImageNetworkError: Error {
    case `default`
}

class MovieImageCacheManager {
    static let shared = NSCache<NSString, UIImage>()
    private init() { }
    
    static func getImage (
        _ url: String,
        completion: @escaping (Result<UIImage, ImageNetworkError>) -> Void
    ) {
        if url.isEmpty { completion(.failure(.default)) }
        let cachedKey = NSString(string: url)
        
        if let cachedImage = ImageCacheManager.shared.object(forKey: cachedKey) {
            completion(.success(cachedImage))
        }
        
        guard let url = URL(string: url) else {
            completion(.failure(.default))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                if let _ = error {
                    completion(.failure(.default))
                }
                if let data = data, let image = UIImage(data: data) {
                    ImageCacheManager.shared.setObject(image, forKey: cachedKey)
                    completion(.success(image))
                }
            }
        }
        .resume()
    }
}

extension UIImageView {
    func getImageFromURL(_ url: String) {
        let imageURL = "http://openweathermap.org/img/wn/" + url + "@2x.png"
        ImageCacheManager.getImage(imageURL) { result in
            switch result {
            case .failure(.default):
                print("fail")
                self.image = UIImage()
            case .success(let image):
                self.image = image
            }
        }
    }
}

