//
//  SeminarFirstViewController.swift
//  Seminar2
//
//  Created by 고아라 on 2023/04/17.
//

import UIKit

final class SeminarFirstViewController: UIViewController, UISheetPresentationControllerDelegate {
    
    private let nameLabel : UILabel = {
        let label  = UILabel()
        label.text = "조금만 더 눌러봐...."
        label.font = .systemFont(ofSize: 16)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    private lazy var nextButton : UIButton = {
        let button = UIButton()
        button.setTitle("다음으로!", for: .normal)
        button.backgroundColor = .systemGreen
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        setLayout()
    }
    
}

extension SeminarFirstViewController{
    func style() {
        
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
    
    
    func nextToSecondViewController(){
        let seminarSemniarSecondViewController = SeminarSecondViewController()
        seminarSemniarSecondViewController.completionHandler = { [weak self] time in
            guard let self else {return}
            self.nameLabel.text = String(time)
        }
        self.present(seminarSemniarSecondViewController, animated: true)
    }
    
    @objc
    func nextButtonTapped(){
        nextToSecondViewController()
    }
    
}

