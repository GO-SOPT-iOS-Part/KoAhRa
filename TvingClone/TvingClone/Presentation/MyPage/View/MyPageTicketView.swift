//
//  MyPageTicketView.swift
//  TvingClone
//
//  Created by 고아라 on 2023/05/03.
//

import UIKit

import SnapKit
import Then

final class MyPageTicketView : UIView {
    
    private let ticketView = UIView()
    private let ticketImage = UIImageView()
    private let ticketLabel = UILabel()
    private let ticketNumLabel = UILabel()
    private let cashImage = UIImageView()
    private let cashLabel = UILabel()
    private let cashNumLabel = UILabel()
    
    private let ticketSubView = UIView()
    private let ticketSubLabel = UILabel()
    private let tvnIcon = UIImageView()
    private let jtbcIcon = UIImageView()
    private let nextButton = UIButton()
    
    
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

extension MyPageTicketView {
    
    private func setStyle(){
        ticketView.do {
            $0.backgroundColor = Color.tvinggray5
            $0.layer.cornerRadius = 3
        }
        
        ticketImage.do {
            $0.image = Image.ticketIcon
        }
        
        ticketLabel.do {
            $0.text = "나의 이용권"
            $0.font = Font.tvingMedium4
            $0.textColor = Color.tvinggray3
        }
        
        ticketNumLabel.do {
            $0.text = "사용중인 이용권이 없습니다."
            $0.font = Font.tvingMedium4
            $0.textColor = Color.tvinggray3
        }
        
        cashImage.do {
            $0.image = Image.cashIcon
        }
        
        cashLabel.do {
            $0.text = "티빙캐시"
            $0.font = Font.tvingMedium4
            $0.textColor = Color.tvinggray3
        }
        
        cashNumLabel.do {
            $0.text = "0"
            $0.font = Font.tvingBold2
            $0.textColor = Color.tvingWhite
        }
        
        ticketSubView.do {
            $0.backgroundColor = Color.tvinggray5
            $0.layer.cornerRadius = 3
        }
        
        ticketSubLabel.do {
            $0.text = "이용권을 구매하고                        등 인기 TV 프로그램과\n다양한 영화 콘텐츠를 자유롭게 시청하세요!"
            $0.font = Font.tvingSemiBold3
            $0.textColor = Color.tvinggray2
            $0.numberOfLines = 2
            $0.setLineSpacing(spacing: 7)
        }
        
        tvnIcon.do {
            $0.image = Image.tvnLogo
        }
        
        jtbcIcon.do {
            $0.image = Image.jtbcLogo
        }
        
        nextButton.do {
            $0.setImage(Image.nextButtonIcon, for: .normal)
        }
    }
    
    private func setLayout(){
        ticketView.addSubviews(ticketImage, ticketLabel, ticketNumLabel, cashImage, cashLabel, cashNumLabel)
        ticketSubView.addSubviews(ticketSubLabel, tvnIcon, jtbcIcon, nextButton)
        self.addSubviews(ticketView, ticketSubView)
        
        ticketView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.width.equalTo(355)
            $0.height.equalTo(92)
        }
        
        ticketImage.snp.makeConstraints {
            $0.top.equalToSuperview().inset(18)
            $0.leading.equalToSuperview().inset(11)
            $0.width.height.equalTo(23)
        }
        
        ticketLabel.snp.makeConstraints {
            $0.top.equalTo(ticketImage.snp.top).offset(3)
            $0.leading.equalTo(ticketImage.snp.trailing).offset(5)
        }
        
        ticketNumLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(21)
            $0.trailing.equalToSuperview().inset(13)
        }
        
        cashImage.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(11)
            $0.leading.equalToSuperview().inset(11)
            $0.width.height.equalTo(23)
        }
        
        cashLabel.snp.makeConstraints {
            $0.top.equalTo(cashImage.snp.top).offset(3)
            $0.leading.equalTo(cashImage.snp.trailing).offset(5)
        }
        
        cashNumLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(13)
            $0.trailing.equalToSuperview().inset(13)
        }
        
        ticketSubView.snp.makeConstraints {
            $0.top.equalTo(self.ticketView.snp.bottom).offset(12)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(355)
            $0.height.equalTo(60)
        }
        
        ticketSubLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(11)
            $0.leading.equalToSuperview().offset(18)
            $0.width.equalTo(270)
            $0.height.equalTo(39)
        }
        
        tvnIcon.snp.makeConstraints {
            $0.top.equalToSuperview().inset(16)
            $0.leading.equalToSuperview().inset(113)
            $0.width.equalTo(25)
            $0.height.equalTo(10)
        }
        
        jtbcIcon.snp.makeConstraints {
            $0.top.equalToSuperview().inset(1)
            $0.leading.equalToSuperview().inset(135)
            $0.width.height.equalTo(40)
        }
        
        nextButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(21)
            $0.trailing.equalToSuperview().inset(13)
            $0.width.equalTo(18)
            $0.height.equalTo(16)
        }
    }
}
