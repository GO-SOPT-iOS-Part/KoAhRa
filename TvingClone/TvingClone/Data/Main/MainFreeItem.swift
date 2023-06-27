//
//  MainFreeItem.swift
//  TvingClone
//
//  Created by 고아라 on 2023/06/26.
//

import UIKit

struct MainFreeItem {
    let posterImage : UIImage
    let posterName : String
}

extension MainFreeItem {
    
    static func mainFreeData() -> [MainFreeItem] {
        return [
            MainFreeItem(posterImage: Image.poster, posterName: "해리포터와 마법사의 돌"),
            MainFreeItem(posterImage: Image.poster, posterName: "해리포터와 마법사의 돌"),
            MainFreeItem(posterImage: Image.poster, posterName: "해리포터와 마법사의 돌"),
            MainFreeItem(posterImage: Image.poster, posterName: "해리포터와 마법사의 돌"),
        ]
    }
}

