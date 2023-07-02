//
//  MainPopularHeaderView.swift
//  TvingClone
//
//  Created by 고아라 on 2023/07/02.
//

import UIKit

import SnapKit
import Then

final class MainPopularHeaderView: UICollectionReusableView {
    
    static let identifier = "MainPopularHeaderView"
    
    private let titleLabel = UILabel()
    private let allButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        // MARK: - 컴포넌트 설정
        setUI()
        
        // MARK: - addsubView
        setHierarchy()
        
        // MARK: - autolayout설정
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

private extension MainPopularHeaderView {
    func setUI() {
        titleLabel.do {
            $0.text = "인기 LIVE 채널"
            $0.font = Font.tvingSemiBold1
            $0.textColor = Color.tvingWhite
        }
        
        allButton.do {
            $0.titleLabel!.text = "전체보기"
            $0.alignTextBelow(spacing: 1)
            $0.imageView?.image = Image.nextButtonIcon
            
        }
    }
    
    func setHierarchy() {
        addSubviews(titleLabel, allButton)
    }
    
    func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
        }
        
        allButton.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.trailing.equalToSuperview().inset(5)
            $0.width.equalTo(55)
            $0.height.equalTo(20)
        }
    }
}

