//
//  MovieViewController.swift
//  Seminar4
//
//  Created by 고아라 on 2023/05/12.
//

import UIKit

import SnapKit
import Then

final class MovieViewController: UIViewController {
    
    private let tableView = UITableView()
    private var movieData: [MovieResponse] = []
    private let idArray: [Int] = [540,541,542,543,544,546,547,548,549,550,551,552,553,554,555]

    override func viewDidLoad() {
        super.viewDidLoad()

        movie()
        setRegister()
        setLayout()
    }
    
    private func movie() {
        
        idArray.forEach {
            MovieService.shared.movie(id: $0) { response in
                switch response {
                case .success(let data) :
                    self.movieData.append(data as! MovieResponse)
                    self.tableView.reloadData()
                default :
                    break
                }
            }
        }
    }
    
    private func setRegister() {
        tableView.do {
            $0.register(MovieTableViewCell.self, forCellReuseIdentifier: MovieTableViewCell.identifier)
            $0.rowHeight = 120
            $0.delegate = self
            $0.dataSource = self
        }
    }
    
    private func setLayout() {
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaInsets)
            $0.bottom.leading.trailing.equalToSuperview()
        }
    }

}

extension MovieViewController: UITableViewDelegate {}

extension MovieViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return idArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.identifier, for: indexPath) as? MovieTableViewCell else { return UITableViewCell() }
        
        if (movieData.count == idArray.count) {
            cell.configureCell(movieData[indexPath.row])
        }
        
        return cell
    }
}

