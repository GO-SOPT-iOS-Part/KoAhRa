//
//  MainViewController.swift
//  TvingClone
//
//  Created by 고아라 on 2023/05/03.
//

import UIKit

import SnapKit
import Then

final class MainViewController: UIViewController {
    
    private let logoView = UIImageView()
    private lazy var profileButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.isHidden = true
        
        setStyle()
        setLayout()
        setAddTarget()
    }

}

extension MainViewController {
    
    private func setStyle() {
        view.backgroundColor = Color.tvingBlack
        
        logoView.do {
            $0.image = Image.tivingMainLogo
        }
        
        profileButton.do {
            $0.setImage(Image.profileLogo, for: .normal)
        }
        
    }
    
    private func setLayout() {
        view.addSubviews(logoView, profileButton)
        
        logoView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(58)
            $0.leading.equalToSuperview().inset(11)
        }
        
        profileButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(55)
            $0.trailing.equalToSuperview().inset(9)
            $0.width.equalTo(33)
            $0.height.equalTo(31)
        }
    }

    private func setAddTarget(){
        profileButton.addTarget(self,
                                action: #selector(profileButtonTapped),
                               for: .touchUpInside)
    }
    
    private func presentToMyPageViewController() {
        let myPageViewController = MyPageViewController()
        myPageViewController.modalPresentationStyle = .fullScreen
        self.present(myPageViewController, animated: true)
    }
    
    @objc
    private func profileButtonTapped() {
        presentToMyPageViewController()
    }
}
