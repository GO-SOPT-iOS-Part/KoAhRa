//
//  MainPosterViewController.swift
//  TvingClone
//
//  Created by 고아라 on 2023/06/16.
//

import UIKit

import SnapKit
import Then

final class MainPosterViewController: UIViewController {
    
    private let mainPosterModel : [MainPosterItem] = MainPosterItem.mainPosterData()

    private lazy var mainPosterView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
    private let flowLayout = UICollectionViewFlowLayout()

    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()

        setHierarchy()

        setLayout()
        
        setDelegate()
    }

}

 private extension MainPosterViewController {
     func setUI() {
         view.backgroundColor = Color.tvingBlack

         flowLayout.do {
             $0.scrollDirection = .horizontal
             $0.itemSize = CGSize(width: 390, height: 498)
             $0.minimumLineSpacing = 0
         }
         
         mainPosterView.do {
             $0.isPagingEnabled = true
         }
     }

     func setHierarchy() {
         view.addSubview(mainPosterView)
         mainPosterView.register(MainPosterViewCell.self, forCellWithReuseIdentifier: MainPosterViewCell.identifier)
     }

     func setLayout() {
         mainPosterView.snp.makeConstraints {
             $0.top.leading.trailing.equalToSuperview()
             $0.height.equalTo(700)
         }
     }
     
     func setDelegate() {
         mainPosterView.delegate = self
         mainPosterView.dataSource = self
     }
 }

extension MainPosterViewController : UICollectionViewDelegate {

 }

extension MainPosterViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainPosterViewCell.identifier, for: indexPath) as? MainPosterViewCell else { return UICollectionViewCell() }
        
        cell.setDataBind(model: mainPosterModel[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mainPosterModel.count
    }
}
