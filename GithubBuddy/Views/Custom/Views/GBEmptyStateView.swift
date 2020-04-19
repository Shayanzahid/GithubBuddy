//
//  GBEmptyStateView.swift
//  GithubBuddy
//
//  Created by Shayan Zahid on 19/04/2020.
//  Copyright © 2020 Shayan Zahid. All rights reserved.
//

import UIKit

class GBEmptyStateView: UIView {
    let messageLabel = GBTitleLabel(textAlignment: .center, fontSize: 28)
    let imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    init(message: String) {
        super.init(frame: .zero)
        
        messageLabel.text = message
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupMessageLabel() {
        addSubview(messageLabel)
        
        messageLabel.numberOfLines = 3
        messageLabel.textColor = .secondaryLabel
        
        NSLayoutConstraint.activate([
            messageLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -150),
            messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            messageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40)
        ])
    }
    
    private func setupImageView() {
        addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = #imageLiteral(resourceName: "empty-state-logo")
        
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1.3),
            imageView.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 1.3),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 170),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 40)
        ])
    }
    
    private func setupViews() {
        setupMessageLabel()
        setupImageView()
    }
}
