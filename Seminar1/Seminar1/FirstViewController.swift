//
//  ViewController.swift
//  Seminar1
//
//  Created by 고아라 on 2023/04/03.
//

import UIKit

final class FirstViewController: UIViewController {
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "이름을 알려주세요!"
        label.textColor = .black
        label.textAlignment = .center
        return label
        
    }()
    
    private lazy var presentButton: UIButton = {
        let button = UIButton()
        button.setTitle("present!", for: .normal)
        button.backgroundColor = .systemGreen
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(presentButtonTapped), for: .touchUpInside)
        return button
        
    }()
      
    private lazy var pushButton: UIButton = {
        let button = UIButton()
        button.setTitle("push!", for: .normal)
        button.backgroundColor = .systemGreen
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(pushButtonTapped), for: .touchUpInside)
        return button
        
    }()
    
    private lazy var tmiButton: UIButton = {
        let button = UIButton()
        button.setTitle("just touch!", for: .normal)
        button.backgroundColor = .systemGreen
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(tmiButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "입력하기.."
        textField.clearButtonMode = .whileEditing
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.borderStyle = .bezel
        textField.layer.borderWidth = 1
        return textField
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
    
        style()
        setLayout()
    }


}

private extension FirstViewController {
    
    private func style() {
        
        view.backgroundColor = .white
    }
    
    private func setLayout() {
        
        [nameLabel, nameTextField,
         presentButton, pushButton,tmiButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        NSLayoutConstraint.activate([nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
                                     nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)])
        
        NSLayoutConstraint.activate([nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
                                     nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                                     nameTextField.heightAnchor.constraint(equalToConstant: 48)])
        
        NSLayoutConstraint.activate([presentButton.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20),
                                     presentButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     presentButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                                     presentButton.heightAnchor.constraint(equalToConstant: 48)])
        
        NSLayoutConstraint.activate([pushButton.topAnchor.constraint(equalTo: presentButton.bottomAnchor, constant: 20),
                                     pushButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     pushButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                                     pushButton.heightAnchor.constraint(equalToConstant: 48)])
        NSLayoutConstraint.activate([tmiButton.topAnchor.constraint(equalTo: pushButton.bottomAnchor, constant: 20),
                                     tmiButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     tmiButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                                     tmiButton.heightAnchor.constraint(equalToConstant: 48)])
    }
    
    private func presentToSecondViewController(){
        let secondViewController = SecondViewController()
        secondViewController.modalPresentationStyle = .fullScreen
        secondViewController.name = nameTextField.text
        self.present(secondViewController, animated: true)
    }
    
    private func pushToSecondViewController(){
        let secondViewController = SecondViewController()
        secondViewController.name = nameTextField.text
        self.navigationController?.pushViewController(secondViewController, animated: true)
    }
    
    private func tmiToThirdViewController(){
        let thirdViewController = ThirdViewController()
        self.navigationController?.pushViewController(thirdViewController, animated: true)
    }
    
    @objc
    private func presentButtonTapped(){
        presentToSecondViewController()
    }
    
    @objc
    private func pushButtonTapped(){
        pushToSecondViewController()
    }
    
    @objc
    private func tmiButtonTapped(){
        tmiToThirdViewController()
    }
}
