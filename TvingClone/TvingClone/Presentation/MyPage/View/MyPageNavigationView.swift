//
//  MyPageNavigationView.swift
//  TvingClone
//
//  Created by 고아라 on 2023/05/03.
//

import UIKit

import SnapKit
import Then

final class MyPageNavigationView : UIView {
    
    private lazy var backButton = UIButton()
    private lazy var alarmButton = UIButton()
    private lazy var settingButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setStyle()
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("errorerrorerror")
    }
}

extension MyPageNavigationView {
    
    private func setStyle() {
        backButton.do {
            $0.setImage(Image.backButtonIcon, for: .normal)
        }
        alarmButton.do {
            $0.setImage(Image.alarmButtonIcon, for: .normal)
        }
        settingButton.do {
            $0.setImage(Image.settingButtonIcon, for: .normal)
        }
    }
    
    private func setLayout() {
        self.addSubviews(backButton, alarmButton, settingButton)
        
        backButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(30)
            $0.leading.equalToSuperview().inset(24)
            $0.width.equalTo(10)
            $0.height.equalTo(17)
        }
        
        alarmButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(16)
            $0.trailing.equalToSuperview().inset(67)
            $0.width.equalTo(30)
            $0.height.equalTo(42)
        }
        
        settingButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(22)
            $0.trailing.equalToSuperview().inset(25)
            $0.width.equalTo(33)
            $0.height.equalTo(31)
        }
    }
}
