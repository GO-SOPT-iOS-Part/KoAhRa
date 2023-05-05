//
//  MyPageView.swift
//  TvingClone
//
//  Created by 고아라 on 2023/05/03.
//

import UIKit

import SnapKit
import Then

final class MyPageView : UIScrollView {
    
    private let myPageNavigationView = MyPageNavigationView()
    private let myPageProfileView = MyPageProfileView()
    private let myPageTicketView = MyPageTicketView()
    public let mypageMenuTableView = MyPageMenuTableView()
    
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

extension MyPageView {
    
    private func setStyle() {
        self.do {
            $0.isScrollEnabled = true
            $0.showsVerticalScrollIndicator = true
        }
    }
    
    private func setLayout() {
        
        self.addSubviews(myPageNavigationView, myPageProfileView, myPageTicketView, mypageMenuTableView)
        
        myPageNavigationView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(45)
        }
        
        myPageProfileView.snp.makeConstraints {
            $0.top.equalTo(self.myPageNavigationView.snp.bottom).offset(35)
            $0.width.equalToSuperview()
            $0.height.equalTo(103)
        }
        
        myPageTicketView.snp.makeConstraints {
            $0.top.equalTo(self.myPageProfileView.snp.bottom)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(355)
            $0.height.equalTo(164)
        }
        
        mypageMenuTableView.snp.makeConstraints {
            $0.top.equalTo(self.myPageTicketView.snp.bottom).offset(24)
            $0.width.equalToSuperview()
            $0.height.equalTo(730)
            $0.bottom.equalToSuperview().inset(10)
        }
    }
}
