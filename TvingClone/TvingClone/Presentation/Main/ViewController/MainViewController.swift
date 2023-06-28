//
//  MainViewController.swift
//  TvingClone
//
//  Created by 고아라 on 2023/05/03.
//

import UIKit

import SnapKit
import Then

final class MainViewController: UIViewController {
    
    private typealias SectionType = Section
    
    @frozen
    private enum Section: CaseIterable {
        case poster
    }
    
    private lazy var mainCollectionView = UICollectionView(frame: .zero, collectionViewLayout: self.setSectionLayout())
    private let mainPosterData : [MainPosterItem] = MainPosterItem.mainPosterData()
    
    private let logoView = UIImageView()
    private lazy var profileButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setLayout()
        setDelegate()
        setRegister()
        setAddTarget()
    }
    
}

extension MainViewController {
    
    private func setStyle() {
        navigationController?.navigationBar.isHidden = true
        
        mainCollectionView.do {
            $0.showsVerticalScrollIndicator = false
            $0.isScrollEnabled = true
            $0.backgroundColor = Color.tvingBlack
            $0.clipsToBounds = true
            $0.contentInsetAdjustmentBehavior = .never
            $0.collectionViewLayout = self.setSectionLayout()
        }
        
        logoView.do {
            $0.image = Image.tivingMainLogo
        }
        
        profileButton.do {
            $0.setImage(Image.profileLogo, for: .normal)
        }
        
    }
    
    private func setLayout() {
        view.addSubviews(mainCollectionView, logoView, profileButton)
        
        mainCollectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        logoView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(58)
            $0.leading.equalToSuperview().inset(11)
        }
        
        profileButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(55)
            $0.trailing.equalToSuperview().inset(9)
            $0.width.equalTo(33)
            $0.height.equalTo(31)
        }
    }
    
    private func setDelegate() {
        mainCollectionView.delegate = self
        mainCollectionView.dataSource = self
    }
    
    private func setRegister() {
        mainCollectionView.register(MainPosterViewCell.self, forCellWithReuseIdentifier: MainPosterViewCell.identifier)
    }
    
    func setSectionLayout() -> UICollectionViewLayout {
        return UICollectionViewCompositionalLayout { sectionIndex, env -> NSCollectionLayoutSection? in
            let sectionType = SectionType.allCases[sectionIndex]
            switch sectionType {
            case .poster:
                return self.getLayoutPosterSection()
            }
        }
    }
    
    func getLayoutPosterSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(500)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )
        group.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0)
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        return section
    }
    
    private func setAddTarget(){
        profileButton.addTarget(self,
                                action: #selector(profileButtonTapped),
                                for: .touchUpInside)
    }
    
    private func presentToMyPageViewController() {
        let myPageViewController = MyPageViewController()
        myPageViewController.modalPresentationStyle = .fullScreen
        self.present(myPageViewController, animated: true)
    }
    
    @objc
    private func profileButtonTapped() {
        presentToMyPageViewController()
    }
    
}

extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let sectionType = SectionType.allCases[indexPath.section]
        switch sectionType {
        case .poster :
            guard let cell = mainCollectionView.dequeueReusableCell(withReuseIdentifier: MainPosterViewCell.identifier, for: indexPath) as? MainPosterViewCell else { return UICollectionViewCell() }
            cell.setDataBind(model: mainPosterData[indexPath.row])
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let sectionType = SectionType.allCases[section]
        switch sectionType {
        case .poster :
            return mainPosterData.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let sectionType = SectionType.allCases[indexPath.section]
        switch sectionType {
        case .poster:
            let view = UICollectionReusableView()
            return view
        }
    }
}

extension MainViewController: UICollectionViewDelegate {
    
}
