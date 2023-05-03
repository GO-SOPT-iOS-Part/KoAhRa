//
//  MyPageProfileView.swift
//  TvingClone
//
//  Created by 고아라 on 2023/05/03.
//

import UIKit

import SnapKit
import Then

final class MyPageProfileView : UIView {
    
    private let profileImage = UIImageView()
    private let profileLabel = UILabel()
    private let profileChangeButton = UIButton()
    
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

extension MyPageProfileView {
    
    private func setStyle() {
        profileImage.do {
            $0.image = Image.profileLogo
        }
        
        profileLabel.do {
            $0.text = "아라아라"
            $0.font = Font.tvingMedium2
            $0.textColor = Color.tvingWhite
        }
        
        profileChangeButton.do {
            $0.setTitle("프로필 전환", for: .normal)
            $0.setTitleColor(Color.tvinggray1, for: .normal)
            $0.titleLabel?.font = Font.tvingMedium3
            $0.layer.borderColor = Color.tvinggray4.cgColor
            $0.layer.borderWidth = 1
            $0.layer.cornerRadius = 2
        }
    }
    
    private func setLayout() {
        self.addSubviews(profileImage, profileLabel, profileChangeButton)
        
        profileImage.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().inset(24)
            $0.width.equalTo(72)
            $0.height.equalTo(74)
        }
        
        profileLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(22)
            $0.leading.equalTo(self.profileImage.snp.trailing).offset(22)
            $0.width.equalTo(70)
            $0.height.equalTo(25)
        }
        
        profileChangeButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(24)
            $0.trailing.equalToSuperview().inset(23)
            $0.width.equalTo(70)
            $0.height.equalTo(25)
        }
    }
}
