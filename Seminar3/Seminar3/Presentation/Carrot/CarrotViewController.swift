//
//  CarrotViewController.swift
//  Seminar3
//
//  Created by 고아라 on 2023/04/29.
//

import UIKit

import SnapKit
import Then

final class CarrotViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dummy.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CarrotTableViewCell.identifier, for: indexPath) as? CarrotTableViewCell else { return UITableViewCell() }
        
        cell.configureCell(dummy[indexPath.row])
        
        return cell
    }
    
    
    private let carrotTableView = UITableView()
    private let dummy = Carrot.dummy()

    override func viewDidLoad() {
        super.viewDidLoad()

        setLayout()
        setStyle()
    }

}

extension CarrotViewController {
    
    private func setLayout() {
        view.backgroundColor = .white
        
        view.addSubview(carrotTableView)
        carrotTableView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaInsets)
            $0.bottom.leading.trailing.equalToSuperview()
        }
    }
    
    private func setStyle() {
        carrotTableView.do {
            $0.register(CarrotTableViewCell.self, forCellReuseIdentifier: CarrotTableViewCell.identifier)
            $0.rowHeight = 120
            $0.delegate = self
            $0.dataSource = self
        }
    }
}
