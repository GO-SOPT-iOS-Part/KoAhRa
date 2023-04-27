//
//  String+.swift
//  TvingClone
//
//  Created by 고아라 on 2023/04/27.
//

import UIKit

extension String {
    func isOnlyKorean() -> Bool {
            let pattern = "^[가-힣ㄱ-ㅎㅏ-ㅣ]+$"
            guard self.range(of: pattern, options: .regularExpression) != nil else { return false }
            return true
     }
}
