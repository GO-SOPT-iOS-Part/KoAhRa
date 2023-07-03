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
        case poster, mustSee, popular, free
    }
    
    private lazy var mainCollectionView = UICollectionView(frame: .zero, collectionViewLayout: self.setSectionLayout())
    private let mainPosterData : [MainPosterItem] = MainPosterItem.mainPosterData()
    private let mainMustSeeData : [MainPosterItem] = MainPosterItem.mainPosterData()
    private let mainPopularData : [MainPopularItem] = MainPopularItem.mainPopularData()
    private let mainFreeData : [MainFreeItem] = MainFreeItem.mainFreeData()
    
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
        mainCollectionView.register(MainMustSeeHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "MainMustSeeHeaderView")
        mainCollectionView.register(MainMustSeeViewCell.self, forCellWithReuseIdentifier: MainMustSeeViewCell.identifier)
        mainCollectionView.register(MainPopularHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "MainPopularHeaderView")
        mainCollectionView.register(MainPopularViewCell.self, forCellWithReuseIdentifier: MainPopularViewCell.identifier)
        mainCollectionView.register(MainFreeHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "MainFreeHeaderView")
        mainCollectionView.register(MainFreeViewCell.self, forCellWithReuseIdentifier: MainFreeViewCell.identifier)
               
    }
    
    func setSectionLayout() -> UICollectionViewLayout {
        return UICollectionViewCompositionalLayout { sectionIndex, env -> NSCollectionLayoutSection? in
            let sectionType = SectionType.allCases[sectionIndex]
            switch sectionType {
            case .poster:
                return self.getLayoutPosterSection()
            case .mustSee:
                return self.getLayoutMustSeeSection()
            case .popular:
                return self.getLayoutPopularSection()
            case .free:
                return self.getLayoutFreeSection()
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
    
    func getLayoutMustSeeSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0/3),
            heightDimension: .fractionalHeight(1.0)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(200)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )
        group.contentInsets = NSDirectionalEdgeInsets(top: 50, leading: 15, bottom: 0, trailing: 0)
        
        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(30)
        )
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top
        )
        header.contentInsets = NSDirectionalEdgeInsets(top: 50, leading: 15, bottom: 0, trailing: 0)
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.boundarySupplementaryItems = [header]
        return section
    }
    
    func getLayoutPopularSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.5),
            heightDimension: .fractionalHeight(1.0)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(150)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )
        group.contentInsets = NSDirectionalEdgeInsets(top: 50, leading: 15, bottom: 0, trailing: 0)
        
        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(30)
        )
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top
        )
        header.contentInsets = NSDirectionalEdgeInsets(top: 50, leading: 15, bottom: 0, trailing: 0)
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.boundarySupplementaryItems = [header]
        return section
    }
    
    func getLayoutFreeSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0/3),
            heightDimension: .fractionalHeight(1.0)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(300)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )
        group.contentInsets = NSDirectionalEdgeInsets(top: 70, leading: 15, bottom: 0, trailing: 0)
        
        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(30)
        )
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top
        )
        header.contentInsets = NSDirectionalEdgeInsets(top: 70, leading: 15, bottom: 0, trailing: 0)
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.boundarySupplementaryItems = [header]
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
        case .poster:
            guard let cell = mainCollectionView.dequeueReusableCell(withReuseIdentifier: MainPosterViewCell.identifier, for: indexPath) as? MainPosterViewCell else { return UICollectionViewCell() }
            cell.setDataBind(model: mainPosterData[indexPath.row])
            return cell
        case .mustSee:
            guard let cell = mainCollectionView.dequeueReusableCell(withReuseIdentifier: MainMustSeeViewCell.identifier, for: indexPath) as? MainMustSeeViewCell else { return UICollectionViewCell() }
            cell.setDataBind(model: mainMustSeeData[indexPath.row])
            return cell
        case .popular:
            guard let cell = mainCollectionView.dequeueReusableCell(withReuseIdentifier: MainPopularViewCell.identifier, for: indexPath) as? MainPopularViewCell else { return UICollectionViewCell() }
            cell.setDataBind(model: mainPopularData[indexPath.row])
            return cell
        case .free:
            guard let cell = mainCollectionView.dequeueReusableCell(withReuseIdentifier: MainFreeViewCell.identifier, for: indexPath) as? MainFreeViewCell else { return UICollectionViewCell() }
            cell.setDataBind(model: mainFreeData[indexPath.row])
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let sectionType = SectionType.allCases[section]
        switch sectionType {
        case .poster:
            return mainPosterData.count
        case .mustSee:
            return mainMustSeeData.count
        case .popular:
            return mainPopularData.count
        case .free:
            return mainFreeData.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let sectionType = SectionType.allCases[indexPath.section]
        switch sectionType {
        case .poster:
            let view = UICollectionReusableView()
            return view
        case .mustSee:
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "MainMustSeeHeaderView", for: indexPath) as! MainMustSeeHeaderView
            return headerView
        case .popular:
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "MainPopularHeaderView", for: indexPath) as! MainPopularHeaderView
            return headerView
        case .free:
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "MainFreeHeaderView", for: indexPath) as! MainFreeHeaderView
            return headerView
        }
    }
}

extension MainViewController: UICollectionViewDelegate {
    
}

extension MainViewController: UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return Section.allCases.count
    }

}
