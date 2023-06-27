//
//  MainFreeViewController.swift
//  TvingClone
//
//  Created by 고아라 on 2023/06/26.
//

import UIKit

import SnapKit
import Then

final class MainFreeViewController: UIViewController {

    private let mainFreeModel : [MainFreeItem] = MainFreeItem.mainFreeData()

    private lazy var mainFreeView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
    private let flowLayout = UICollectionViewFlowLayout()

    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()

        setHierarchy()

        setLayout()
        
        setDelegate()
    }

}

private extension MainFreeViewController {
    func setUI() {
        view.backgroundColor = Color.tvingBlack

        flowLayout.do {
            $0.scrollDirection = .horizontal
            $0.itemSize = CGSize(width: 98, height: 160)
            $0.minimumLineSpacing = 8
        }
    }

    func setHierarchy() {
        view.addSubview(mainFreeView)
        mainFreeView.register(MainFreeViewCell.self, forCellWithReuseIdentifier: MainFreeViewCell.identifier)
    }

    func setLayout() {
        mainFreeView.snp.makeConstraints {
            $0.top.trailing.equalToSuperview()
            $0.leading.equalToSuperview().inset(15)
            $0.height.equalTo(300)
        }
    }
    
    func setDelegate() {
        mainFreeView.delegate = self
        mainFreeView.dataSource = self
    }
}

extension MainFreeViewController : UICollectionViewDelegate {

}

extension MainFreeViewController : UICollectionViewDataSource {
   func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainFreeViewCell.identifier, for: indexPath) as? MainFreeViewCell else { return UICollectionViewCell() }
       
       cell.setDataBind(model: mainFreeModel[indexPath.row])
       return cell
   }
   
   func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return mainFreeModel.count
   }
}
