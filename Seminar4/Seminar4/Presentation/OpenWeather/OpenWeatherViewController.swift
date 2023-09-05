//
//  OpenWeatherViewController.swift
//  Seminar4
//
//  Created by 고아라 on 2023/05/09.
//

import UIKit

final class OpenWeatherViewController: UIViewController {
    
    private let openWeatherView = OpenWeatherView()
    private lazy var openWeatherTableView = openWeatherView.tableView
    private var weatherListViewModel = WeatherListViewModel()
    
    private let cityName = ["gongju", "gwangju", "gumi", "gunsan", "daegu", "daejeon", "mokpo", "busan", "seosan", "seoul", "sokcho", "suwon", "suncheon", "ulsan", "iksan", "jeonju", "jeju", "cheonan", "cheongju", "chuncheon"]
    
    override func loadView() {
        super.loadView()
        self.view = openWeatherView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        openWeather()
        setDelegate()
    }
}

private extension OpenWeatherViewController {
    func setDelegate() {
        openWeatherTableView.delegate = self
        openWeatherTableView.dataSource = self
    }
    
    func openWeather() {
        cityName.forEach {
            OpenWeatherService.shared.openWeather(place: $0) { response in
                switch response {
                case .success(let data) :
                    if let openWeatherResponse = data as? OpenWeatherResponse {
                        let weatherResponse = convertToWeatherResponse(from: openWeatherResponse)
                        self.weatherListViewModel.addWeatherData(weatherResponse)
                    }
                    self.openWeatherTableView.reloadData()
                default :
                    break
                }
            }
        }
    }
}

extension OpenWeatherViewController: UITableViewDelegate {}

extension OpenWeatherViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherListViewModel.numberOfSections
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: OpenWeatherTableViewCell.identifier, for: indexPath) as? OpenWeatherTableViewCell else { return UITableViewCell() }
        
        if (weatherListViewModel.numberOfSections == cityName.count) {
            let weatherViewModel = weatherListViewModel.weatherListData[indexPath.row]
            cell.configureCell(weatherViewModel)
        }
        return cell
    }
}
