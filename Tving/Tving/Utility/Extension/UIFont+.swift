//
//  TvingFont.swift
//  Tving
//
//  Created by 고아라 on 2023/04/18.
//

import UIKit

extension UIFont {
    
    // MARK: - Pretendard
    
    public enum pretendardType: String {
        case semibold = "SemiBold"
        case regular = "Regular"
        case medium = "Medium"
    }
    
    static func pretendard(_ type: pretendardType, size: CGFloat) -> UIFont {
        return UIFont(name: "Pretendard-\(type.rawValue)", size: size)!
    }
}
