//
//  MainMustSeeViewCell.swift
//  TvingClone
//
//  Created by 고아라 on 2023/06/19.
//

import UIKit

import SnapKit
import Then

final class MainMustSeeViewCell: UICollectionViewCell {
    
    static let identifier = "MainMustSeeViewCell"
    
    private let mainMustSeePoster = UIImageView()

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

extension MainMustSeeViewCell {
    func setUI() {
        mainMustSeePoster.do {
            $0.contentMode = .scaleToFill
            $0.layer.cornerRadius = 3
        }
    }
    
    func setHierarchy() {
        addSubview(mainMustSeePoster)
    }
    
    func setLayout() {
        mainMustSeePoster.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
            $0.width.equalTo(98)
            $0.height.equalTo(146)
        }
    }
    
    func setDataBind(model : MainPosterItem) {
        mainMustSeePoster.do {
            $0.image = model.posterImage
        }
    }
}

