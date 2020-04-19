//
//  FollowerCell.swift
//  GithubBuddy
//
//  Created by Shayan Zahid on 14/04/2020.
//  Copyright © 2020 Shayan Zahid. All rights reserved.
//

import UIKit

class FollowerCell: UICollectionViewCell {
    private let padding: CGFloat = 8
    
    static let reuseID = "com.GithubBuddy.followerCell"
    
    var avatarImage = GBAvatarImageView(frame: .zero)
    var usernameLabel = GBTitleLabel(textAlignment: .center, fontSize: 16)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(with follower: Follower) {
        usernameLabel.text = follower.login
    }
    
    private func setupAvatarImage() {
        addSubview(avatarImage)
        
        NSLayoutConstraint.activate([
            avatarImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            avatarImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            avatarImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            avatarImage.heightAnchor.constraint(equalTo: avatarImage.widthAnchor)
        ])
    }
    
    private func setupUsernameLabel() {
        addSubview(usernameLabel)
        
        NSLayoutConstraint.activate([
            usernameLabel.topAnchor.constraint(equalTo: avatarImage.bottomAnchor, constant: 12),
            usernameLabel.widthAnchor.constraint(equalTo: avatarImage.widthAnchor),
        ])
    }
    
    private func setupViews() {
        setupAvatarImage()
        setupUsernameLabel()
    }
}
