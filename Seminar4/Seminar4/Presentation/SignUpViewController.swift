//
//  SignUpViewController.swift
//  Seminar4
//
//  Created by 고아라 on 2023/05/08.
//

import UIKit

final class SignUpViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        signUp()
    }
    
    private func signUp() {
        
        SignUpService.shared.signUp(email: "ahra1234@gmail.com",
                                    nickname: "ahra",
                                    password: "Qwer1234*") { response in
            switch response {
            case .success(let data):
                guard let data = data as? SignUpResponse else { return }
                dump(data)
            default:
                return
            }
        }
    }
}
