//
//  MainPopularViewCell.swift
//  TvingClone
//
//  Created by 고아라 on 2023/06/26.
//

import UIKit

import SnapKit
import Then

final class MainPopularViewCell: UICollectionViewCell {
    
    static let identifier = "MainPopularViewCell"
    
    private let mainPopularPoster = UIImageView()
    private let mainPopularNumber = UILabel()
    private let mainPopularChannel = UILabel()
    private let mainPopularName = UILabel()
    private let mainPopularPercent = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        // MARK: - 컴포넌트 설정
        setUI()
        
        // MARK: - addsubView
        setHierarchy()
        
        // MARK: - autolayout설정
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension MainPopularViewCell {
    func setUI() {
        backgroundColor = Color.tvingBlack
        
        mainPopularPoster.do {
            $0.contentMode = .scaleToFill
            $0.layer.cornerRadius = 3
        }
        
        mainPopularNumber.do {
            $0.text = "1"
            $0.textColor = Color.tvingWhite
            $0.font = Font.tvingBold3
        }
        
        mainPopularChannel.do {
            $0.text = "Mnet"
            $0.textColor = Color.tvingWhite
            $0.font = Font.tvingMedium3
        }
        
        mainPopularName.do {
            $0.text = "보이즈 플래닛 12화"
            $0.textColor = Color.tvinggray2
            $0.font = Font.tvingMedium3
        }
        
        mainPopularPercent.do {
            $0.text = "80%"
            $0.textColor = Color.tvinggray2
            $0.font = Font.tvingMedium3
        }
    }
    
    func setHierarchy() {
        addSubviews(mainPopularPoster, mainPopularNumber, mainPopularChannel, mainPopularName, mainPopularPercent)
    }
    
    func setLayout() {
        mainPopularPoster.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
            $0.width.equalTo(160)
            $0.height.equalTo(80)
        }
        
        mainPopularNumber.snp.makeConstraints {
            $0.top.equalTo(mainPopularPoster.snp.bottom).offset(13)
            $0.leading.equalToSuperview().inset(10)
        }
        
        mainPopularChannel.snp.makeConstraints {
            $0.top.equalTo(mainPopularPoster.snp.bottom).offset(11)
            $0.leading.equalTo(mainPopularNumber.snp.trailing).offset(5)
        }
        
        mainPopularName.snp.makeConstraints {
            $0.top.equalTo(mainPopularChannel.snp.bottom)
            $0.leading.equalTo(mainPopularNumber.snp.trailing).offset(5)
        }
        
        mainPopularPercent.snp.makeConstraints {
            $0.top.equalTo(mainPopularName.snp.bottom)
            $0.leading.equalTo(mainPopularNumber.snp.trailing).offset(5)
        }
    }
    
    func setDataBind(model : MainPopularItem) {
        mainPopularPoster.image = model.posterImage
        mainPopularNumber.text = model.posterNum
        mainPopularChannel.text = model.posterChannel
        mainPopularName.text = model.posterName
        mainPopularPercent.text = model.posterPercent
    }
}
