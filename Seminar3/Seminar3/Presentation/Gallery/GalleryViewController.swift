//
//  GalleryViewController.swift
//  Seminar3
//
//  Created by 고아라 on 2023/04/29.
//

import UIKit

class GalleryViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return dummyCase.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GalleryCollectionViewCell.identifier, for: indexPath) as? GalleryCollectionViewCell else { return UICollectionViewCell() }
        
        cell.configureCell(dummyCase[indexPath.item])
        
        return cell
    }
    
    
    private lazy var collectionView = UICollectionView(frame: .zero,
                                                      collectionViewLayout: flowLayout)
    private let flowLayout = UICollectionViewFlowLayout()
    private var dummyCase = Photo.dummy()

    override func viewDidLoad() {
        super.viewDidLoad()

        setStyle()
        setLayout()
    }
    
    
    func setStyle() {
        
        collectionView.do {
            $0.register(GalleryCollectionViewCell.self, forCellWithReuseIdentifier: GalleryCollectionViewCell.identifier)
            $0.showsVerticalScrollIndicator = false
            $0.delegate = self
            $0.dataSource = self
        }
        
        flowLayout.do {
            $0.itemSize = CGSize(width: (UIScreen.main.bounds.width - 6) / 3 , height: (UIScreen.main.bounds.width - 6) / 3)
            $0.minimumLineSpacing = 3
            $0.minimumInteritemSpacing = 3
        }
    }
    
    func setLayout() {
        
        view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaInsets)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
}
