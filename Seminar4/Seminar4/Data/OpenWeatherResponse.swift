//
//  OpenWeatherResponse.swift
//  Seminar4
//
//  Created by 고아라 on 2023/05/09.
//

//import Foundation
//
//// MARK: - OpenWeatherResponse
//struct OpenWeatherResponse: Codable {
//    let coord: Coord
//    let weather: [Weather]
//    let base: String
//    let main: Main
//    let visibility: Int
//    let wind: Wind
//    let clouds: Clouds
//    let dt: Int
//    let sys: Sys
//    let timezone, id: Int
//    let name: String
//    let cod: Int
//}
//
//// MARK: - Clouds
//struct Clouds: Codable {
//    let all: Int
//}
//
//// MARK: - Coord
//struct Coord: Codable {
//    let lon, lat: Double
//}
//
//// MARK: - Main
//struct Main: Codable {
//    let temp, feelsLike, tempMin, tempMax: Double
//    let pressure, humidity, seaLevel, grndLevel: Int
//
//    enum CodingKeys: String, CodingKey {
//        case temp
//        case feelsLike = "feels_like"
//        case tempMin = "temp_min"
//        case tempMax = "temp_max"
//        case pressure, humidity
//        case seaLevel = "sea_level"
//        case grndLevel = "grnd_level"
//    }
//}
//
//// MARK: - Sys
//struct Sys: Codable {
//    let type, id: Int
//    let country: String
//    let sunrise, sunset: Int
//}
//
//// MARK: - Weather
//struct Weather: Codable {
//    let id: Int
//    let main, description, icon: String
//}
//
//// MARK: - Wind
//struct Wind: Codable {
//    let speed: Double
//    let deg, gust: Int
//}

import Foundation

struct OpenWeatherResponse: Codable {
    let weather: [Weather]
    let main: Main
    let wind: Wind
    let name: String
}

struct Weather: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}

struct Main: Codable {
    let temp: Double
    let feels_like: Double
    let temp_min: Double
    let temp_max: Double
    let pressure: Int
    let humidity: Int
}

struct Wind: Codable {
    let speed: Double
}
