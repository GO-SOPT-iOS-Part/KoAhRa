//
//  SeminarSecondViewController.swift
//  Seminar2
//
//  Created by 고아라 on 2023/04/17.
//

import UIKit
import SnapKit

final class SeminarSecondViewController: UIViewController {
    
    typealias handler = ((Int) -> (Void))
    var completionHandler: handler?
    
    var time : Int = 0
    
    private lazy var pushButton : UIButton = {
        let button = UIButton()
        button.setTitle("눌러줘!", for: .normal)
        button.backgroundColor = .systemGreen
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(pushButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var backButton : UIButton = {
        let button = UIButton()
        button.setTitle("이전으로", for: .normal)
        button.backgroundColor = .systemGreen
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        setLayout()
        
    }
    

}

extension SeminarSecondViewController{
    
    func style() {
        
        view.backgroundColor = .white
    }
    
    func setLayout() {
        
        [pushButton, backButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        pushButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(300)
            $0.leading.equalToSuperview().inset(20)
            $0.trailing.equalToSuperview().inset(20)
        }
        
        backButton.snp.makeConstraints{
            $0.top.equalTo(pushButton.snp.bottom).offset(30)
            $0.leading.equalToSuperview().inset(20)
            $0.trailing.equalToSuperview().inset(20)
        }

    }
    
    func backToFirstViewController(){
        if self.navigationController == nil {
            completionHandler?(time)
            self.dismiss(animated: true, completion: nil)
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    @objc
    func backButtonTapped(){
        backToFirstViewController()
    }
    
    @objc
    func pushButtonTapped(){
        time = time + 1
    }
}
