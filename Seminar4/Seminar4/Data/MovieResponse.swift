//
//  MovieResponse.swift
//  Seminar4
//
//  Created by 고아라 on 2023/05/12.
//

import Foundation

// MARK: - MovieResponse
struct MovieResponse: Codable {
    let id : Int
    let posterPath: String
    let releaseDate: String
    let title: String
    let voteAverage: Double

    enum CodingKeys: String, CodingKey {
        case id
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title
        case voteAverage = "vote_average"
    }
}

