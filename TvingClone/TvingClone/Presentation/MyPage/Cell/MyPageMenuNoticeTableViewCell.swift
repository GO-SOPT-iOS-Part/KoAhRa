//
//  MyPageMenuNoticeTableViewCell.swift
//  TvingClone
//
//  Created by 고아라 on 2023/05/05.
//

import UIKit

import SnapKit
import Then

class MyPageMenuNoticeTableViewCell: UITableViewCell {
    
    static let identifier = "MyPageMenuNoticeTableViewCell"
    
    private let titleLabel = UILabel()
    private let menuButton = UIButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setStyle()
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setStyle() {
        separatorInset.left = 0
        selectionStyle = .none
        
        titleLabel.do {
            $0.textColor = Color.tvinggray2
            $0.font = Font.tvingMedium5
        }
        
        menuButton.do {
            $0.setImage(Image.nextButtonIcon, for: .normal)
        }
    }
    
    private func setLayout() {
        
        contentView.addSubviews(titleLabel, menuButton)
        contentView.backgroundColor = Color.tvingBlack
        
        titleLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(18)
            $0.width.equalTo(150)
            $0.height.equalTo(21)
        }
        
        menuButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(18)
            $0.width.equalTo(18)
            $0.height.equalTo(16)
        }
    }
    
    func configureCell(_ noticeTitle : MenuNotice) {
        titleLabel.text = noticeTitle.noticeTitle
    }
    
}

