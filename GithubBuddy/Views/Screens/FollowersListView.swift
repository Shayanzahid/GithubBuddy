//
//  FollowersListView.swift
//  GithubBuddy
//
//  Created by Shayan Zahid on 09/04/2020.
//  Copyright © 2020 Shayan Zahid. All rights reserved.
//

import UIKit

class FollowersListView: UIView {
    var followersListVC: FollowersListVC? {
        didSet {
            
        }
    }
    
    var collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    override func layoutSubviews() {
        super.layoutSubviews()

        collectionView.frame = bounds
        collectionView.collectionViewLayout = UIHelper.threeColumnFlowLayout(in: self)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .systemBackground
        
        setupScreen()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCollectionView() {
        addSubview(collectionView)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        collectionView.register(FollowerCell.self, forCellWithReuseIdentifier: FollowerCell.reuseID)
    }
    
    private func setupScreen() {
        setupCollectionView()
    }
}
