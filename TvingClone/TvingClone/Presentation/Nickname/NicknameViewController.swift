//
//  NicknameViewController.swift
//  TvingClone
//
//  Created by 고아라 on 2023/04/27.
//

import UIKit
import SnapKit
import Then

protocol DataBindProtocol : AnyObject {
    func dataBind(userNickName : String)
}

final class NicknameViewController: UIViewController {
    
    private let nicknameLabel = UILabel()
    private let nicknameTextField = UITextField()
    private let nicknameSaveButton = UIButton()
    
    weak var delegate: DataBindProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
        setLayout()
        setTarget()
        setDelegate()
    }

}

extension NicknameViewController {
    private func setUI() {
        view.backgroundColor = Color.tvingWhite
        
        nicknameLabel.do {
            $0.text = "닉네임을 입력해주세요"
            $0.font = Font.tvingMedium
        }
        
        nicknameTextField.do {
            $0.placeholder = "닉네임"
            $0.backgroundColor = Color.tvinggray2
            $0.textColor = Color.tvinggray4
            $0.font = Font.tvingSemiBold2
            $0.layer.cornerRadius = 3
            $0.setLeftPaddingPoints(24)
        }
        
        nicknameSaveButton.do {
            $0.setTitle("저장하기", for: .normal)
            $0.titleLabel?.font = Font.tvingSemiBold2
            $0.setTitleColor(Color.tvingWhite, for: .normal)
            $0.backgroundColor = Color.tvinggray2
            $0.layer.cornerRadius = 12
            $0.isEnabled = false
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
    
    private func setTarget() {
        nicknameSaveButton.addTarget(self, action: #selector(nicknameSaveButtonTapped), for: .touchUpInside)
    }
    
    private func setDelegate() {
        nicknameTextField.delegate = self
    }
    
    @objc
    private func nicknameSaveButtonTapped() {
        guard let text = nicknameTextField.text else { return }
        delegate?.dataBind(userNickName: text)
        self.dismiss(animated: true)
    }
    
    private func nicknameIsKorean() -> Bool {
        guard let text = nicknameTextField.text else { return false}
        
        if text.isOnlyKorean() {
            return true
        }
        
        return false
    }
    
    private func nicknameSaveButtonActive() {
        if nicknameSaveButton.isEnabled {
            nicknameSaveButton.backgroundColor = Color.tvingRed
        } else {
            nicknameSaveButton.backgroundColor = Color.tvinggray2
        }
    }
}

extension NicknameViewController : UITextFieldDelegate {
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        
        if nicknameTextField.hasText && nicknameIsKorean() {
            nicknameSaveButton.isEnabled = true
            nicknameSaveButtonActive()
        } else {
            nicknameSaveButton.isEnabled = false
            nicknameSaveButtonActive()
        }
    }
}
