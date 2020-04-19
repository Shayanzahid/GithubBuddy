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
    
    private let networkManager = NetworkManager.shared
    
    var username: String!
    var followers = [Follower]()
    
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
        
        getFollowers()
        configureDataSource()
    }
    
    func getFollowers() {
        networkManager.getFollowers(for: username, page: 1) { result in
            
            switch result {
            case .success(let followers):
                self.followers = followers
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
