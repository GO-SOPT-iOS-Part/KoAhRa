//
//  MainPopularViewController.swift
//  TvingClone
//
//  Created by 고아라 on 2023/06/26.
//

import UIKit

import SnapKit
import Then

final class MainPopularViewController: UIViewController {

    private let mainPopularModel : [MainPopularItem] = MainPopularItem.mainPopularData()

    private lazy var mainPopularView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
    private let flowLayout = UICollectionViewFlowLayout()

    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()

        setHierarchy()

        setLayout()
        
        setDelegate()
    }

}

private extension MainPopularViewController {
    func setUI() {
        view.backgroundColor = Color.tvingBlack

        flowLayout.do {
            $0.scrollDirection = .horizontal
            $0.itemSize = CGSize(width: 160, height: 150)
            $0.minimumLineSpacing = 7
        }
    }

    func setHierarchy() {
        view.addSubview(mainPopularView)
        mainPopularView.register(MainPopularViewCell.self, forCellWithReuseIdentifier: MainPopularViewCell.identifier)
    }

    func setLayout() {
        mainPopularView.snp.makeConstraints {
            $0.top.trailing.equalToSuperview()
            $0.leading.equalToSuperview().inset(15)
            $0.height.equalTo(300)
        }
    }
    
    func setDelegate() {
        mainPopularView.delegate = self
        mainPopularView.dataSource = self
    }
}

extension MainPopularViewController : UICollectionViewDelegate {

}

extension MainPopularViewController : UICollectionViewDataSource {
   func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainPopularViewCell.identifier, for: indexPath) as? MainPopularViewCell else { return UICollectionViewCell() }
       
       cell.setDataBind(model: mainPopularModel[indexPath.row])
       return cell
   }
   
   func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return mainPopularModel.count
   }
}
