//
//  MainFreeViewCell.swift
//  TvingClone
//
//  Created by 고아라 on 2023/06/26.
//

import UIKit

import SnapKit
import Then

final class MainFreeViewCell: UICollectionViewCell {
    
    static let identifier = "MainPopularViewCell"
    
    private let mainFreePoster = UIImageView()
    private let mainFreeName = UILabel()

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


extension MainFreeViewCell {
    func setUI() {
        backgroundColor = Color.tvingBlack
        
        mainFreePoster.do {
            $0.contentMode = .scaleToFill
            $0.layer.cornerRadius = 3
        }
        
        mainFreeName.do {
            $0.textColor = Color.tvinggray2
            $0.font = Font.tvingMedium3
        }
        
    }
    
    func setHierarchy() {
        addSubviews(mainFreePoster, mainFreeName)
    }
    
    func setLayout() {
        mainFreePoster.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.width.equalTo(98)
            $0.height.equalTo(146)
        }
        
        mainFreeName.snp.makeConstraints {
            $0.top.equalTo(mainFreePoster.snp.bottom).offset(3)
            $0.leading.equalToSuperview()
        }
    
    }
    
    func setDataBind(model : MainFreeItem) {
        mainFreePoster.image = model.posterImage
        mainFreeName.text = model.posterName
    }
}

