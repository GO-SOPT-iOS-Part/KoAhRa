//
//  ThirdViewController.swift
//  Seminar1
//
//  Created by 고아라 on 2023/04/06.
//

import UIKit

final class ThirdViewController: UIViewController {
    
    private let imageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "img.png")
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        setLayout()
    }
    

}

extension ThirdViewController{
    
    private func style() {
        
        view.backgroundColor = .white
    }
    
    private func setLayout(){
        
        [imageView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        NSLayoutConstraint.activate([imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
                                     imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)])
        
    }
}

