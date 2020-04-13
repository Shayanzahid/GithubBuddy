//
//  SearchNC.swift
//  GithubBuddy
//
//  Created by Shayan Zahid on 02/04/2020.
//  Copyright © 2020 Shayan Zahid. All rights reserved.
//

import UIKit

class SearchVC: UIViewController {
    let searchView = SearchView()
    
    override func loadView() {
        super.loadView()
        
        searchView.searchVC = self
        view = searchView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hidesKeyboardOnTap()
        
        searchView.usernameTextField.delegate = self
    }
    
    @objc func searchTapped() {
        pushFollowersListVC()
    }
    
    private func pushFollowersListVC() {
        guard searchView.isUsernameEntered else {
            presentGBAlert(title: "Empty username", message: "Please enter a username. We need to know who to look for 😅.", buttonTitle: "Got it")
            return
        }
        
        let followersListVC = FollowersListVC()
        followersListVC.username = searchView.usernameTextField.text
        followersListVC.title = searchView.usernameTextField.text
        
        navigationController?.pushViewController(followersListVC, animated: true)
    }
}

extension SearchVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        pushFollowersListVC()
        return true
    }
}
