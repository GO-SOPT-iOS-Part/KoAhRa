//
//  FirstViewController_Closure.swift
//  Seminar2
//
//  Created by 고아라 on 2023/04/14.
//


import UIKit

final class FirstViewController_Closure: UIViewController {
    
    private let nameLabel : UILabel = {
        let label = UILabel()
        label.text = "이름이 무엇인지 알려주세요!"
        label.font = .systemFont(ofSize: 16)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    private lazy var nextButton : UIButton = {
        let button = UIButton()
        button.setTitle("알려주러 가기", for: .normal)
        button.backgroundColor = .systemPurple
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 10
        button.addTarget(self,
                         action: #selector(pushToSecondViewController), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        setLayout()
    }
    
}

extension FirstViewController_Closure {
    func style(){
        view.backgroundColor = .white
    }
    
    func setLayout() {
        [nameLabel, nextButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        NSLayoutConstraint.activate([nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     nameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)])
        
        
        NSLayoutConstraint.activate([nextButton.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
                                     nextButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                                     nextButton.heightAnchor.constraint(equalToConstant: 48)])
    }
    
    @objc
    func pushToSecondViewController() {
        let secondViewController = SecondViewController_Closure()
        secondViewController.completionHandler = { [weak self] text in
            guard let self else {return}
            self.nameLabel.text = text
            //self?.nameLabel.text = text
        }
        self.navigationController?.pushViewController(secondViewController, animated: true)
    }
}
