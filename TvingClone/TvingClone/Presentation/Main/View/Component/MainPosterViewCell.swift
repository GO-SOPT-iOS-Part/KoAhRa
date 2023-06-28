//
//  MainPosterViewCell.swift
//  TvingClone
//
//  Created by 고아라 on 2023/06/16.
//

import UIKit

import SnapKit
import Then

final class MainPosterViewCell: UICollectionViewCell {
    
    static let identifier = "MainPosterViewCell"
    
    private let mainPosterImage = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        // MARK: - 컴포넌트 설정
        setUI()
        
        // MARK: - addsubView
        setHierarchy()
        
        // MARK: - autolayout설정
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MainPosterViewCell {
    func setUI() {
        mainPosterImage.do {
            $0.contentMode = .scaleToFill
        }
    }
    
    func setHierarchy() {
        addSubview(mainPosterImage)
    }
    
    func setLayout() {
        mainPosterImage.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(498)
        }
    }
    
    func setDataBind(model : MainPosterItem) {
        mainPosterImage.do {
            $0.image = model.posterImage
        }
    }
}
