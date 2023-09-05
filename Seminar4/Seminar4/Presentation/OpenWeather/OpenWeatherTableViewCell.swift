//
//  OpenWeatherTableViewCell.swift
//  Seminar4
//
//  Created by 고아라 on 2023/05/10.
//

import UIKit

import SnapKit
import Then
import Alamofire

final class OpenWeatherTableViewCell: UITableViewCell {
    
    static let identifier = "OpenWeatherTableViewCell"
    
    private let weatherImage = UIImageView()
    private let cityNameLabel = UILabel()
    private let cityTempLabel = UILabel()
    private let cityHumidLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setStyle()
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setStyle() {
        separatorInset.left = 0
        selectionStyle = .none
        
        cityNameLabel.do {
            $0.font = UIFont.boldSystemFont(ofSize: 17)
        }
        cityTempLabel.do {
            $0.font = UIFont.systemFont(ofSize: 12)
        }
        cityHumidLabel.do {
            $0.font = UIFont.systemFont(ofSize: 12)
        }
    }
    
    func setLayout() {
        
        [weatherImage, cityNameLabel, cityTempLabel, cityHumidLabel].forEach { contentView.addSubview($0) }
        
        weatherImage.snp.makeConstraints {
            $0.size.equalTo(100)
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(10)
        }
        
        cityNameLabel.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(20)
            $0.top.equalToSuperview().inset(20)
        }
        
        cityTempLabel.snp.makeConstraints {
            $0.top.equalTo(cityNameLabel.snp.bottom).offset(10)
            $0.trailing.equalTo(cityNameLabel.self)
        }
        
        cityHumidLabel.snp.makeConstraints {
            $0.top.equalTo(cityTempLabel.snp.bottom).offset(10)
            $0.trailing.equalTo(cityTempLabel.self)
        }
        
    }
    
    func configureCell(_ weather : WeatherResponse) {
        let imageURL = weather.icon
        weatherImage.getImageFromURL(imageURL)
        cityNameLabel.text = weather.name
        cityTempLabel.text = "현재 온도 : \(weather.temp)°C"
        cityHumidLabel.text = "습도 : \(weather.humidity)%"
    }
}
