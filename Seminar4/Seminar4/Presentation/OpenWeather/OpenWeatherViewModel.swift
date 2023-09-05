//
//  OpenWeatherViewModel.swift
//  Seminar4
//
//  Created by 고아라 on 2023/08/30.
//

import Foundation

struct WeatherListViewModel {
    var weatherListData: [WeatherResponse] = []
}

struct WeatherViewModel {
    var weather: WeatherResponse
}

extension WeatherListViewModel {
    var numberOfSections: Int {
        return weatherListData.count
    }
    
    mutating func addWeatherData(_ weatherResponse: WeatherResponse) {
        weatherListData.append(weatherResponse)
    }
    
    func weatherAtIndex(_ index: Int) -> WeatherViewModel {
        let idx = self.weatherListData[index]
        return WeatherViewModel(idx)
    }
}

extension WeatherViewModel {
    init(_ weather: WeatherResponse) {
        self.weather = weather
    }
}

extension WeatherViewModel {
    var icon: String {
        return self.weather.icon
    }
    var name: String {
        return self.weather.name
    }
    var temp: Double {
        return self.weather.temp
    }
    var humidity: Int {
        return self.weather.humidity
    }
}
