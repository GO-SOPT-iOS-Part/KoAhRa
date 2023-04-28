//
//  WelcomeViewController.swift
//  TvingClone
//
//  Created by 고아라 on 2023/04/20.
//

import UIKit

import SnapKit
import Then

final class WelcomeViewController: UIViewController {
    
    private let logoView = UIImageView()
    private let welcomeLabel = UILabel()
    private let goMainButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setLayout()
        setAddTarget()
    }

}

extension WelcomeViewController {
    private func setUI(){
        view.backgroundColor = Color.tvingBlack
        
        logoView.do {
            $0.image = Image.tivingLogo
        }
        
        welcomeLabel.do {
            $0.textColor = Color.tvinggray1
            $0.font = UIFont.pretendard(.bold, size: 23)
            $0.textAlignment = .center
            $0.numberOfLines = 2
        }
        
        goMainButton.do {
            $0.setTitle("메인으로", for: .normal)
            $0.titleLabel?.font = UIFont.pretendard(.semibold, size: 14)
            $0.setTitleColor(Color.tvingWhite, for: .normal)
            $0.backgroundColor = Color.tvingRed
            $0.titleLabel?.textAlignment = .center
            $0.layer.cornerRadius = 3
        }
    }
    
    private func setLayout(){
        view.addSubviews(logoView, welcomeLabel, goMainButton)
        
        logoView.snp.makeConstraints{
            $0.top.equalToSuperview().inset(58)
            $0.leading.trailing.equalToSuperview()
        }
        welcomeLabel.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(logoView.snp.bottom).offset(67)
        }
        goMainButton.snp.makeConstraints{
            $0.bottom.equalToSuperview().offset(-66)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
    }
    
    private func setAddTarget(){
        goMainButton.addTarget(self,
                               action: #selector(goMainButtonTapped),
                               for: .touchUpInside)
    }
    
    @objc
    private func goMainButtonTapped(){
        if self.navigationController == nil{
            self.dismiss(animated: true, completion: nil)
        }else{
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    func setDataBind(userNickName : String){
        welcomeLabel.text = "\(userNickName)님 \n반가워요!"
        
    }
}
