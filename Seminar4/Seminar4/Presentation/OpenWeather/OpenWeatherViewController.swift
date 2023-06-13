//
//  OpenWeatherViewController.swift
//  Seminar4
//
//  Created by 고아라 on 2023/05/09.
//

import UIKit

import SnapKit
import Then

final class OpenWeatherViewController: UIViewController {
    
    private let tableView = UITableView()
    private var weatherData: [OpenWeatherResponse] = []
    
    
    private let cityName = ["gongju", "gwangju", "gumi", "gunsan", "daegu", "daejeon", "mokpo", "busan", "seosan", "seoul", "sokcho", "suwon", "suncheon", "ulsan", "iksan", "jeonju", "jeju", "cheonan", "cheongju", "chuncheon"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        openWeather()
        setRegister()
        setLayout()
    }
    
    private func openWeather() {
        
        cityName.forEach {
            OpenWeatherService.shared.openWeather(place: $0) { response in
                switch response {
                case .success(let data) :
                    self.weatherData.append(data as! OpenWeatherResponse)
                    self.tableView.reloadData()
                default :
                    break
                }
            }
        }
    }

    private func setRegister() {
        tableView.do {
            $0.register(OpenWeatherTableViewCell.self, forCellReuseIdentifier: OpenWeatherTableViewCell.identifier)
            $0.rowHeight = 120
            $0.delegate = self
            $0.dataSource = self
        }
        
    }
    
    private func setLayout() {
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaInsets)
            $0.bottom.leading.trailing.equalToSuperview()
        }
    }
    
}

extension OpenWeatherViewController: UITableViewDelegate {}

extension OpenWeatherViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cityName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: OpenWeatherTableViewCell.identifier, for: indexPath) as? OpenWeatherTableViewCell else { return UITableViewCell() }
        
        if (weatherData.count == cityName.count) {
            cell.configureCell(weatherData[indexPath.row])
        }
        
        return cell
    }
}
