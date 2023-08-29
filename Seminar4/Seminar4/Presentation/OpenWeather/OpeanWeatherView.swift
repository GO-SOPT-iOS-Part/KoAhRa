//
//  OpeanWeatherView.swift
//  Seminar4
//
//  Created by 고아라 on 2023/08/29.
//

import UIKit

import SnapKit

final class OpenWeatherView: UIView {
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = 120
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setHierarchy()
        setLayout()
        registerCell()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

private extension OpenWeatherView {
    func setHierarchy() {
        self.addSubview(tableView)
    }
    
    func setLayout() {
        tableView.snp.makeConstraints {
            $0.top.equalTo(safeAreaInsets)
            $0.bottom.leading.trailing.equalToSuperview()
        }
    }
    
    func registerCell() {
        tableView.register(OpenWeatherTableViewCell.self, forCellReuseIdentifier: OpenWeatherTableViewCell.identifier)
    }
}
