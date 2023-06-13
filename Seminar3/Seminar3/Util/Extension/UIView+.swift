//
//  UIView+.swift
//  Seminar3
//
//  Created by 고아라 on 2023/04/29.
//

import UIKit

extension UIView {
    
    func makeRounded(radius: CGFloat) {
        self.clipsToBounds = true
        self.layer.cornerRadius = radius
    }
}
