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
        
        view = searchView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
