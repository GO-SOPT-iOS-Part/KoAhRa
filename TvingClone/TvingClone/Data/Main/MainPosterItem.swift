//
//  MainPosterItem.swift
//  TvingClone
//
//  Created by 고아라 on 2023/06/16.
//

import UIKit

struct MainPosterItem {
    let posterImage : UIImage
}

extension MainPosterItem {
    
    static func mainPosterData() -> [MainPosterItem] {
        return [
            MainPosterItem(posterImage: Image.poster),
            MainPosterItem(posterImage: Image.poster),
            MainPosterItem(posterImage: Image.poster),
            MainPosterItem(posterImage: Image.poster),
            MainPosterItem(posterImage: Image.poster)
        ]
    }
}
