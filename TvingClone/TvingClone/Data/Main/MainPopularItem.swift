//
//  MainPopularItem.swift
//  TvingClone
//
//  Created by 고아라 on 2023/06/26.
//

import UIKit

struct MainPopularItem {
    let posterImage : UIImage
    let posterNum : String
    let posterChannel : String
    let posterName : String
    let posterPercent : String
}

extension MainPopularItem {
    
    static func mainPopularData() -> [MainPopularItem] {
        return [
            MainPopularItem(posterImage: Image.poster, posterNum: "1", posterChannel: "tVN", posterName: "보이스 플래닛 12화", posterPercent: "80%"),
            MainPopularItem(posterImage: Image.poster, posterNum: "2", posterChannel: "Mnet", posterName: "하트시그널 4화", posterPercent: "24.1%"),
            MainPopularItem(posterImage: Image.poster, posterNum: "3", posterChannel: "tVN", posterName: "보이스 플래닛 12화", posterPercent: "80%")
        ]
    }
}
