//
//  UserInfoVC.swift
//  GithubBuddy
//
//  Created by Shayan Zahid on 22/04/2020.
//  Copyright © 2020 Shayan Zahid. All rights reserved.
//

import UIKit

class UserInfoVC: UIViewController {
    private let userInfoView = UserInfoView()
    
    var follower: Follower!
    
    override func loadView() {
        super.loadView()
        
        view = userInfoView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissVC))
        navigationItem.rightBarButtonItem = doneButton
        
        getUserInfo()
    }
    
    @objc func dismissVC() {
        dismiss(animated: true)
    }
    
    func getUserInfo() {
        NetworkManager.shared.getUserInfo(for: follower.login) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let user):
                print(user)
            case .failure(let error):
                self.presentGBAlert(title: "Something went wrong", message: error.rawValue, buttonTitle: "Ok")
            }
        }
    }
}
