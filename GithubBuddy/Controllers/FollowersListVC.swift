//
//  FollowersListVC.swift
//  GithubBuddy
//
//  Created by Shayan Zahid on 08/04/2020.
//  Copyright © 2020 Shayan Zahid. All rights reserved.
//

import UIKit

class FollowersListVC: UIViewController {
    
    enum Section {
        case main
    }
    
    private let followersListView = FollowersListView()
    
    var username: String!
    var followers = [Follower]()
    var page = 1
    var hasMoreFollowers = true
    
    var datasource: UICollectionViewDiffableDataSource<Section, Follower>!
    
    override func loadView() {
        super.loadView()
        
        view = followersListView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        followersListView.collectionView.delegate = self
        
        getFollowers(for: username, page: page)
        configureDataSource()
    }
    
    func getFollowers(for username: String, page: Int) {
        NetworkManager.shared.getFollowers(for: username, page: page) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let followers):
                self.hasMoreFollowers = followers.count < 100 ? false : true
                self.followers.append(contentsOf: followers)
                self.updateData()
            case .failure(let error):
                self.presentGBAlert(title: "Bad stuff happened", message: error.rawValue, buttonTitle: "Ok bro")
            }
        }
    }
    
    func configureDataSource() {
        datasource = UICollectionViewDiffableDataSource<Section, Follower>(collectionView: followersListView.collectionView, cellProvider: { (collectionView, indexPath, follower) -> UICollectionViewCell? in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FollowerCell.reuseID, for: indexPath) as! FollowerCell
            cell.setupCell(with: follower)
            
            return cell
        })
    }
    
    func updateData() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Follower>()
        snapshot.appendSections([.main])
        snapshot.appendItems(followers)
        datasource.apply(snapshot, animatingDifferences: true)
    }
}

extension FollowersListVC: UICollectionViewDelegate {
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let height = scrollView.frame.size.height
        
        if offsetY > contentHeight - height {
            guard hasMoreFollowers else { return }
            page += 1
            getFollowers(for: username, page: page)
        }
    }
}
