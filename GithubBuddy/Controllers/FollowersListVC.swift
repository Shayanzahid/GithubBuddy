//
//  FollowersListVC.swift
//  GithubBuddy
//
//  Created by Shayan Zahid on 08/04/2020.
//  Copyright © 2020 Shayan Zahid. All rights reserved.
//

import UIKit

class FollowersListVC: UIViewController {
    private let followersListView = FollowersListView()
    
    private let networkManager = NetworkManager.shared
    
    var username: String!
    
    
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
    }
    
    private func getFollowers() {
        networkManager.getFollowers(for: username, page: 1) { result in
            
            switch result {
            case .success(let followers):
                print(followers.count)
            case .failure(let error):
                self.presentGBAlert(title: "Bad stuff happened", message: error.rawValue, buttonTitle: "Ok bro")
            }
        }
    }
}
