//
//  MovieTableViewCell.swift
//  Seminar4
//
//  Created by 고아라 on 2023/05/12.
//

import UIKit

import SnapKit
import Then
import Alamofire

class MovieTableViewCell: UITableViewCell {
    
    static let identifier = "MovieTableViewCell"
    
    private let movieImage = UIImageView()
    private let movieNameLabel = UILabel()
    private let movieDateLabel = UILabel()
    private let movieVoteLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setStyle()
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setStyle() {
        separatorInset.left = 0
        selectionStyle = .none
        
        movieNameLabel.do {
            $0.font = UIFont.boldSystemFont(ofSize: 17)
        }
        movieDateLabel.do {
            $0.font = UIFont.systemFont(ofSize: 12)
        }
        movieVoteLabel.do {
            $0.font = UIFont.systemFont(ofSize: 12)
        }
    }
    
    func setLayout() {
        
        [movieImage, movieNameLabel, movieDateLabel, movieVoteLabel].forEach { contentView.addSubview($0) }
        
        movieImage.snp.makeConstraints {
            $0.size.equalTo(100)
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(10)
        }
        
        movieNameLabel.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(20)
            $0.top.equalToSuperview().inset(20)
        }
        
        movieDateLabel.snp.makeConstraints {
            $0.top.equalTo(movieNameLabel.snp.bottom).offset(10)
            $0.trailing.equalTo(movieNameLabel.self)
        }
        
        movieVoteLabel.snp.makeConstraints {
            $0.top.equalTo(movieDateLabel.snp.bottom).offset(10)
            $0.trailing.equalTo(movieDateLabel.self)
        }
        
    }
    
    func configureCell(_ movie : MovieResponse) {
        let imageURL = movie.posterPath
        movieImage.getMovieImageFromURL(imageURL)

        movieNameLabel.text = movie.title
        
        let date  = String(movie.releaseDate)
        movieDateLabel.text = "개봉일자 : " + date
        
        let vote  = String(movie.voteAverage)
        movieVoteLabel.text = "평점 : " + vote
        
    }
}

