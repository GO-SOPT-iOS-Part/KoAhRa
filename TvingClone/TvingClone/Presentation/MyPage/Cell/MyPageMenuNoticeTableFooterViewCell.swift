//
//  MyPageMenuNoticeTableFooterViewCell.swift
//  TvingClone
//
//  Created by 고아라 on 2023/05/05.
//

import UIKit

import SnapKit
import Then

final class MyPageMenuNoticeTableFooterViewCell: UITableViewHeaderFooterView {
    
    static let identifier = "MyPageMenuNoticeTableFooterViewCell"
    
    private let logoutButton = UIButton()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        setStyle()
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

extension MyPageMenuNoticeTableFooterViewCell {
    
    private func setStyle() {
        
        logoutButton.do {
            $0.backgroundColor = Color.tvingBlack
            $0.setTitle("로그아웃", for: .normal)
            $0.titleLabel?.font = Font.tvingMedium6
            $0.titleLabel?.textColor = Color.tvinggray4
            $0.layer.cornerRadius = 2
            $0.layer.borderColor = Color.tvinggray4.cgColor
            $0.layer.borderWidth = 1
            
        }
    }
    
    private func setLayout() {
        self.addSubview(logoutButton)
        
        logoutButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(23)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(359)
            $0.height.equalTo(55)
        }
    }
}
