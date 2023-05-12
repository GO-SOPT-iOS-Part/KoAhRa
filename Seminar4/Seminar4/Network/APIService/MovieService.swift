//
//  MovieService.swift
//  Seminar4
//
//  Created by 고아라 on 2023/05/12.
//

import Foundation

import Alamofire

final class MovieService {
    
    static let shared = MovieService()
    
    private init() {}
    
    private func makeUrl(id : Int) -> String {
        return "https://api.themoviedb.org/3/movie/\(id)?api_key=3ca1dbf046d0387bbb3c2e6cdfca67ae"
    }
    
    func movie (id : Int,
                      completion: @escaping (NetworkResult<Any>) -> Void) {
        
        let header: HTTPHeaders = ["Content-Type" : "application/json"]
        let dataRequest = AF.request(makeUrl(id: id),
                                     method: .get,
                                     headers: header)
        
        dataRequest.responseData { response in
            switch response.result {
            case .success :
                guard let statusCode = response.response?.statusCode else { return }
                guard let value = response.value else { return }
                let networkResult = self.judgeStatus(by: statusCode, value)
                completion(networkResult)
            case .failure :
                completion(.networkErr)
            }
        }
        
    }
    
    private func judgeStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        switch statusCode {
        case 200: return isValidData(data: data)
        case 400, 404, 409: return isValidData(data: data)
        case 500: return .serverErr
        default: return .networkErr
        }
    }
    
    private func isValidData(data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        
        guard let decodedData = try? decoder.decode(MovieResponse.self, from: data) else { return .pathErr }

        return .success(decodedData as Any)
    }
}
