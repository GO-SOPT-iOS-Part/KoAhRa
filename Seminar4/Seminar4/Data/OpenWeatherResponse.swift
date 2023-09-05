//
//  OpenWeatherResponse.swift
//  Seminar4
//
//  Created by 고아라 on 2023/05/09.
//

import Foundation

struct WeatherResponse: Codable {
    let icon: String
    let name: String
    let temp: Double
    let humidity: Int
}

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

func convertToWeatherResponse(from openWeatherResponse: OpenWeatherResponse) -> WeatherResponse {
    let weather = openWeatherResponse.weather.first
    let main = openWeatherResponse.main
    let weatherResponse = WeatherResponse(
        icon: weather?.icon ?? "",
        name: openWeatherResponse.name,
        temp: main.temp,
        humidity: main.humidity
    )
    return weatherResponse
}
