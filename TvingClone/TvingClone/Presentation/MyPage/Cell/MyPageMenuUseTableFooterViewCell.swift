//
//  MyPageMenuUseTableFooterViewCell.swift
//  TvingClone
//
//  Created by 고아라 on 2023/05/05.
//

import UIKit

import SnapKit
import Then

final class MyPageMenuUseTableFooterViewCell: UITableViewHeaderFooterView {
    
    static let identifier = "MyPageMenuUseTableFooterViewCell"
    
    private let separatorView = UIView()
    
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

extension MyPageMenuUseTableFooterViewCell {
    
    private func setStyle() {
        
        separatorView.do {
            $0.backgroundColor = Color.tvinggray4
        }
    }
    
    private func setLayout() {
        self.addSubview(separatorView)
        
        separatorView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.width.equalTo(359)
            $0.height.equalTo(1)
        }
    }
}
