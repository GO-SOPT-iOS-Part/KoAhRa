//
//  SignInViewController.swift
//  TvingClone
//
//  Created by 고아라 on 2023/04/19.
//

import UIKit
import SnapKit
import Then

class SignInViewController: UIViewController {
    
    private let backButton = UIButton()
    private let signInLabel = UILabel()
    private let idTextField = UITextField()
    private let idClearButton = UIButton()
    private let passwordTextField = UITextField()
    private let passwordClearButton = UIButton()
    private let passwordSecurityButton = UIButton()
    private let signInButton = UIButton()
    private let idFindButton = UIButton()
    private let betweenView = UIView()
    private let passwordFindButton = UIButton()
    private let accountLabel = UILabel()
    private let createButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setLayout()
        setDelegate()
    }
    
}

extension SignInViewController {
    
    private func setUI() {
        view.backgroundColor = Color.tvingBlack
        
        backButton.do {
            $0.setImage(Image.backButtonIcon, for: .normal)
        }
        
        signInLabel.do {
            $0.text = "TVING ID 로그인"
            $0.font = UIFont.pretendard(.medium, size:23)
            $0.textAlignment = .center
            $0.textColor = Color.tvingWhite
        }
        
        idTextField.do {
            $0.placeholder = "아이디"
            $0.setPlaceholderColor(Color.tvinggray2)
            $0.backgroundColor = Color.tvinggray4
            $0.font = UIFont.pretendard(.semibold, size: 15)
            $0.textColor = Color.tvinggray2
            $0.layer.cornerRadius = 3
            $0.autocapitalizationType = .none
            $0.setLeftPaddingPoints(22)
        }
        
        idClearButton.do {
            $0.setImage(Image.deleteIcon, for: .normal)
            $0.isHidden = true
        }
        
        passwordTextField.do {
            $0.placeholder = "비밀번호"
            $0.setPlaceholderColor(Color.tvinggray2)
            $0.backgroundColor = Color.tvinggray4
            $0.font = UIFont.pretendard(.semibold, size: 15)
            $0.textColor = Color.tvinggray2
            $0.layer.cornerRadius = 3
            $0.autocapitalizationType = .none
            $0.setLeftPaddingPoints(22)
            $0.isSecureTextEntry = true
        }
        
        passwordClearButton.do {
            $0.setImage(Image.deleteIcon, for: .normal)
            $0.isHidden = true
        }
        
        passwordSecurityButton.do {
            $0.setImage(Image.passwordHideIcon, for: .normal)
            $0.isHidden = true
        }
        
        signInButton.do {
            $0.setTitle("로그인하기", for: .normal)
            $0.titleLabel?.font = UIFont.pretendard(.semibold, size: 14)
            $0.setTitleColor(Color.tvinggray4, for: .normal)
            $0.layer.borderColor = Color.tvinggray4.cgColor
            $0.layer.borderWidth = 1
            $0.layer.cornerRadius = 3
            $0.isEnabled = false
        }
        
        idFindButton.do {
            $0.setTitle("아이디 찾기", for: .normal)
            $0.setTitleColor(Color.tvinggray2, for: .normal)
            $0.titleLabel?.font = UIFont.pretendard(.semibold, size: 14)
        }
        
        betweenView.do {
            $0.backgroundColor = Color.tvinggray4
        }
        
        passwordFindButton.do {
            $0.setTitle("비밀번호 찾기", for: .normal)
            $0.setTitleColor(Color.tvinggray2, for: .normal)
            $0.titleLabel?.font = UIFont.pretendard(.semibold, size: 14)
        }
        
        accountLabel.do {
            $0.text = "아직 계정이 없으신가요?"
            $0.textColor = Color.tvinggray3
            $0.font = UIFont.pretendard(.semibold, size: 14)
        }
        
        createButton.do {
            $0.setTitle("닉네임 만들러가기", for: .normal)
            $0.titleLabel?.font = UIFont.pretendard(.regular, size: 14)
            $0.setTitleColor(Color.tvinggray2, for: .normal)
            $0.setUnderline()
        }
    }
    
    private func setLayout() {
        view.addSubviews(backButton, signInLabel, idTextField, passwordTextField, signInButton,idFindButton, betweenView, passwordFindButton, accountLabel, createButton)
        idTextField.addSubview(idClearButton)
        passwordTextField.addSubviews(passwordClearButton, passwordSecurityButton)
        
        backButton.snp.makeConstraints{
            $0.top.equalToSuperview().inset(65)
            $0.leading.equalToSuperview().inset(24)
        }
        
        signInLabel.snp.makeConstraints{
            $0.top.equalTo(backButton.snp.bottom).offset(10)
            $0.leading.equalToSuperview().inset(109)
        }
        
        idTextField.snp.makeConstraints{
            $0.top.equalTo(signInLabel.snp.bottom).offset(31)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
        
        idClearButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.width.height.equalTo(20)
            $0.trailing.equalToSuperview().offset(-20)
        }
        
        passwordTextField.snp.makeConstraints{
            $0.top.equalTo(idTextField.snp.bottom).offset(7)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
        
        passwordClearButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.height.width.equalTo(20)
            $0.trailing.equalToSuperview().offset(-56)
        }
        
        passwordSecurityButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.height.width.equalTo(20)
            $0.trailing.equalToSuperview().offset(-20)
        }
        
        signInButton.snp.makeConstraints{
            $0.top.equalTo(passwordTextField.snp.bottom).offset(21)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
        
        betweenView.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(signInButton.snp.bottom).offset(36)
            $0.width.equalTo(1)
            $0.height.equalTo(12)
        }
        
        idFindButton.snp.makeConstraints{
            $0.top.equalTo(signInButton.snp.bottom).offset(31)
            $0.leading.equalToSuperview().inset(85)
            $0.height.equalTo(22)
        }
        
        passwordFindButton.snp.makeConstraints{
            $0.top.equalTo(signInButton.snp.bottom).offset(31)
            $0.trailing.equalToSuperview().inset(86)
            $0.height.equalTo(22)
        }
        
        accountLabel.snp.makeConstraints{
            $0.top.equalTo(idFindButton.snp.bottom).offset(28)
            $0.leading.equalToSuperview().inset(51)
            $0.height.equalTo(22)
        }
        
        createButton.snp.makeConstraints{
            $0.top.equalTo(passwordFindButton.snp.bottom).offset(28)
            $0.trailing.equalToSuperview().inset(65)
            $0.height.equalTo(22)
        }
        
    }
    
    private func setDelegate() {
        idTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    private func textFieldBorderSetting(textField: UITextField) {
        textField.layer.borderColor = Color.tvinggray2.cgColor
        textField.layer.borderWidth = 1
        textField.placeholder = .none
    }
    
    private func textFieldButtonSetting(textField: UITextField) {
        switch textField
        {
        case idTextField:
            if idTextField.hasText && idTextField.isEditing{
                idClearButton.isHidden = false
            }else {
                idClearButton.isHidden = true
            }
        case passwordTextField:
            if passwordTextField.hasText && passwordTextField.isEditing {
                passwordClearButton.isHidden = false
                passwordSecurityButton.isHidden = false
            } else {
                passwordClearButton.isHidden = true
                passwordSecurityButton.isHidden = true
            }
        default:
            return
        }
    }
    
    private func loginButtonActive() {
        if signInButton.isEnabled == true {
            signInButton.backgroundColor = Color.tvingRed
            signInButton.setTitleColor(Color.tvingWhite, for: .normal)
            signInButton.layer.borderWidth = 0
        } else {
            signInButton.setTitleColor(Color.tvinggray4, for: .normal)
            signInButton.backgroundColor = Color.tvingBlack
            signInButton.layer.borderWidth = 1
        }
    }
    
}

extension SignInViewController : UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textFieldBorderSetting(textField: textField)
        textFieldButtonSetting(textField: textField)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        textFieldButtonSetting(textField: textField)
        if idTextField.hasText && passwordTextField.hasText {
            signInButton.isEnabled = true
            loginButtonActive()
        } else {
            signInButton.isEnabled = false
            loginButtonActive()
        }
        return true
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textFieldButtonSetting(textField: textField)
        textField.layer.borderWidth = 0
    }
    
}
