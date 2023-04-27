//
//  String+.swift
//  TvingClone
//
//  Created by 고아라 on 2023/04/27.
//

import UIKit

extension String {
    func isValidEmail() -> Bool {
            let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
            return emailTest.evaluate(with: self)
    }
    
    func isOnlyKorean() -> Bool {
            let pattern = "^[가-힣ㄱ-ㅎㅏ-ㅣ]+$"
            guard self.range(of: pattern, options: .regularExpression) != nil else { return false }
            return true
     }
}
