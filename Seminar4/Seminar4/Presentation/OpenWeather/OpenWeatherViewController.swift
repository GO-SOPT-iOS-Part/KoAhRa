//
//  OpenWeatherViewController.swift
//  Seminar4
//
//  Created by 고아라 on 2023/05/09.
//

import UIKit

final class OpenWeatherViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        openWeather()
    }
    
    private func openWeather() {
        
        let cityName = ["gongju", "gwangju", "gumi", "gunsan", "daegu", "daejeon", "mokpo", "busan", "seosan", "seoul", "sokcho", "suwon", "suncheon", "ulsan", "iksan", "jeonju", "jeju", "cheonan", "cheongju", "chuncheon"]
        
        cityName.forEach {
            OpenWeatherService.shared.openWeather(place: $0) { response in
                print(response)
            }
        }
    }

}
