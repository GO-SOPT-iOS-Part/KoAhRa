//
//  OpenWeatherService.swift
//  Seminar4
//
//  Created by 고아라 on 2023/05/09.
//

import Foundation

import Alamofire

final class OpenWeatherService {
    
    static let shared = OpenWeatherService()
    
    private init() {}
    
    private func makeUrl(place : String) -> String {
        return "https://api.openweathermap.org/data/2.5/weather?q=\(place)&appid=08dd40e27c122bc4aacca8b880dcbb89"
    }
    
    func openWeather (place : String,
                      completion: @escaping (NetworkResult<Any>) -> Void) {
        
        let header: HTTPHeaders = ["Content-Type" : "application/json"]
        let dataRequest = AF.request(makeUrl(place: place),
                                     method: .get,
                                     headers: header)
        
        dataRequest.responseData { response in
            switch response.result {
            case .success :
                print(place)
                guard let statusCode = response.response?.statusCode else { return }
                print(statusCode)
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
        
        guard let decodedData = try? decoder.decode(OpenWeatherResponse.self, from: data) else { return .pathErr }
        
        return .success(decodedData as Any)
    }
}
