//
//  MainMustSeeViewController.swift
//  TvingClone
//
//  Created by 고아라 on 2023/06/19.
//

import UIKit

import SnapKit
import Then

final class MainMustSeeViewController: UIViewController {
    
    private let mainPosterModel : [MainPosterItem] = MainPosterItem.mainPosterData()

    private lazy var mainMustSeeView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
    private let flowLayout = UICollectionViewFlowLayout()

    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()

        setHierarchy()

        setLayout()
        
        setDelegate()
    }

}

 private extension MainMustSeeViewController {
     func setUI() {
         view.backgroundColor = Color.tvingBlack

         flowLayout.do {
             $0.scrollDirection = .horizontal
             $0.itemSize = CGSize(width: 98, height: 146)
             $0.minimumLineSpacing = 8
         }
     }

     func setHierarchy() {
         view.addSubview(mainMustSeeView)
         mainMustSeeView.register(MainMustSeeViewCell.self, forCellWithReuseIdentifier: MainMustSeeViewCell.identifier)
     }

     func setLayout() {
         mainMustSeeView.snp.makeConstraints {
             $0.top.trailing.equalToSuperview()
             $0.leading.equalToSuperview()
             $0.height.equalTo(300)
         }
     }
     
     func setDelegate() {
         mainMustSeeView.delegate = self
         mainMustSeeView.dataSource = self
     }
 }

extension MainMustSeeViewController : UICollectionViewDelegate {

 }

extension MainMustSeeViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainMustSeeViewCell.identifier, for: indexPath) as? MainMustSeeViewCell else { return UICollectionViewCell() }
        
        cell.setDataBind(model: mainPosterModel[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mainPosterModel.count
    }
}
