//
//  UIFont+.swift
//  TvingClone
//
//  Created by 고아라 on 2023/04/19.
//

import UIKit

extension UIFont {
    public enum pretendardType: String {
        case medium = "Medium"
        case regular = "Regular"
        case semibold = "SemiBold"
        case bold = "Bold"
    }

    static func pretendard(_ type: pretendardType, size: CGFloat) -> UIFont {
        return UIFont(name: "Pretendard-\(type.rawValue)", size: size)!
    }
}
