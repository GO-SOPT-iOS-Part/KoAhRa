//
//  MyPageViewController.swift
//  TvingClone
//
//  Created by 고아라 on 2023/05/03.
//

import UIKit

class MyPageViewController: UIViewController {
    
    private let myPageView = MyPageView()
    private let menuUseDummy = MenuUse.dummyMenuUse()
    private let menuNoticeDummy = MenuNotice.dummyMenuNotice()
    
    override func loadView() {
        self.view = myPageView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setAddTarget()
    }
    
}

extension MyPageViewController {
    
    private func setStyle() {
        
        view.backgroundColor = Color.tvingBlack
        self.navigationController?.isNavigationBarHidden = true
        
    }
    
    private func setAddTarget() {
        myPageView.mypageMenuTableView.tableView.delegate = self
        myPageView.mypageMenuTableView.tableView.dataSource = self
    }
}

extension MyPageViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 54
        case 1:
            return 54
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            return 32
        case 1:
            return 205
        default:
            return 0
        }
    }
}

extension MyPageViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return menuUseDummy.count
        case 1:
            return menuNoticeDummy.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MyPageMenuUseTableViewCell.identifier, for: indexPath) as? MyPageMenuUseTableViewCell else { return UITableViewCell()}
            cell.configureCell(menuUseDummy[indexPath.row])
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MyPageMenuNoticeTableViewCell.identifier, for: indexPath) as? MyPageMenuNoticeTableViewCell else { return UITableViewCell()}
            cell.configureCell(menuNoticeDummy[indexPath.row])
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        switch section {
        case 0:
            guard let footer = tableView.dequeueReusableHeaderFooterView(withIdentifier: MyPageMenuUseTableFooterViewCell.identifier) as? MyPageMenuUseTableFooterViewCell else { return UIView()}
            return footer
        case 1:
            guard let footer = tableView.dequeueReusableHeaderFooterView(withIdentifier: MyPageMenuNoticeTableFooterViewCell.identifier) as? MyPageMenuNoticeTableFooterViewCell else { return UIView()}
            return footer
        default:
            return UIView()
        }
    }
}
