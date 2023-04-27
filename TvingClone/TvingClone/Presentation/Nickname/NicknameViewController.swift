//
//  NicknameViewController.swift
//  TvingClone
//
//  Created by 고아라 on 2023/04/27.
//

import UIKit
import SnapKit
import Then

class NicknameViewController: UIViewController {
    
    private let nicknameLabel = UILabel()
    private let nicknameTextField = UITextField()
    private let nicknameSaveButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
        setLayout()
    }

}

extension NicknameViewController {
    private func setUI() {
        view.backgroundColor = Color.tvingWhite
        
        nicknameLabel.do {
            $0.text = "닉네임을 입력해주세요"
            $0.font = UIFont.pretendard(.medium, size: 23)
        }
        
        nicknameTextField.do {
            $0.placeholder = "닉네임"
            $0.backgroundColor = Color.tvinggray2
            $0.textColor = Color.tvinggray4
            $0.font = UIFont.pretendard(.semibold, size: 14)
            $0.layer.cornerRadius = 3
            $0.setLeftPaddingPoints(24)
        }
        
        nicknameSaveButton.do {
            $0.setTitle("저장하기", for: .normal)
            $0.titleLabel?.font = UIFont.pretendard(.semibold, size: 14)
            $0.setTitleColor(Color.tvingWhite, for: .normal)
            $0.backgroundColor = Color.tvingRed
            $0.layer.cornerRadius = 12
        }
    }
    
    private func setLayout() {
        view.addSubviews(nicknameLabel, nicknameTextField, nicknameSaveButton)
        
        nicknameLabel.snp.makeConstraints{
            $0.top.equalToSuperview().inset(52)
            $0.leading.equalToSuperview().inset(20)
        }
        
        nicknameTextField.snp.makeConstraints{
            $0.height.equalTo(52)
            $0.top.equalTo(nicknameLabel.snp.bottom).offset(21)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
        nicknameSaveButton.snp.makeConstraints{
            $0.height.equalTo(52)
            $0.bottom.equalToSuperview().inset(20)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
    }
}
