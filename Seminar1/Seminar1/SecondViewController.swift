//
//  SecondViewController.swift
//  Seminar1
//
//  Created by 고아라 on 2023/04/03.
//

import UIKit

final class SecondViewController: UIViewController {
    
    var name : String?
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "제 이름은요!"
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.setTitle("뒤로가기", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 20)
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        style()
        setLayout()
        setDataBind()
    }

}

extension SecondViewController {
    
    private func style() {
        
        view.backgroundColor = .white
    }
    
    private func setLayout(){
        
        [nameLabel, backButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        NSLayoutConstraint.activate([nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     nameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)])
    
        
        NSLayoutConstraint.activate([backButton.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
                                     backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     backButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                                     backButton.heightAnchor.constraint(equalToConstant: 48)])
    }
    
    @objc
    private func backButtonTapped(){
        if self.navigationController == nil{
            self.dismiss(animated: true, completion: nil)
        }else{
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    private func setDataBind(){
        guard let name = self.name else { return }
        nameLabel.text = (name=="") ? "쉿 비밀이에요" : "저는 \(name)입니다!"
    }
}
