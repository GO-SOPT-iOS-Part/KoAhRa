//
//  UIView+.swift
//  TvingClone
//
//  Created by 고아라 on 2023/04/19.
//

import UIKit

extension UIView {
    
    func addSubviews(_ views: UIView...) {
        views.forEach {
            self.addSubview($0)
        }
    }
}
