//
//  MyPageMenuTableView.swift
//  TvingClone
//
//  Created by 고아라 on 2023/05/05.
//

import UIKit

import SnapKit
import Then

final class MyPageMenuTableView : UIView {
    
    public let tableView = UITableView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setTableCell()
        setStyle()
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("errorerrorerror")
    }
}

extension MyPageMenuTableView {
    private func setStyle() {
        
        tableView.do {
            $0.backgroundColor = Color.tvingBlack
            $0.isScrollEnabled = false
            $0.showsVerticalScrollIndicator = false
        }
        
    }
    
    private func setLayout() {
        self.addSubview(tableView)
        
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func setTableCell() {
        tableView.register(
            MyPageMenuUseTableViewCell.self,
            forCellReuseIdentifier: MyPageMenuUseTableViewCell.identifier
        )
        
        tableView.register(
            MyPageMenuNoticeTableViewCell.self,
            forCellReuseIdentifier: MyPageMenuNoticeTableViewCell.identifier
        )
        
        tableView.register(
            MyPageMenuUseTableFooterViewCell.self,
            forHeaderFooterViewReuseIdentifier: MyPageMenuUseTableFooterViewCell.identifier
        )
        
        tableView.register(
            MyPageMenuNoticeTableFooterViewCell.self,
            forHeaderFooterViewReuseIdentifier: MyPageMenuNoticeTableFooterViewCell.identifier
        )
        
    }
}

