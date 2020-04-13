//
//  GBAlertView.swift
//  GithubBuddy
//
//  Created by Shayan Zahid on 12/04/2020.
//  Copyright © 2020 Shayan Zahid. All rights reserved.
//

import UIKit

class GBAlertView: UIView {
    var titleLabel = GBTitleLabel(textAlignment: .center, fontSize: 20)
    var messageLabel = GBBodyLabel(textAlignment: .center)
    var actionButton = GBButton(backgroundColor: .systemPink, title: "Got it")
    
    private let padding: CGFloat = 20
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupAlertContainer()
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupAlertContainer() {
        translatesAutoresizingMaskIntoConstraints = false
        
        backgroundColor = .systemBackground
        layer.cornerRadius = 16
        layer.borderWidth = 2
        layer.borderColor = UIColor.white.cgColor
    }
    
    private func setupTitleLabel() {
        addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding)
        ])
    }
    
    private func setupActionButton() {
        addSubview(actionButton)
        
        NSLayoutConstraint.activate([
            actionButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -padding),
            actionButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            actionButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            actionButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    private func setupMessageLabel() {
        addSubview(messageLabel)
        
        messageLabel.numberOfLines = 4
        
        NSLayoutConstraint.activate([
            messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            messageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            messageLabel.bottomAnchor.constraint(equalTo: actionButton.topAnchor, constant: -12)
        ])
    }
    
    private func setupViews() {
        setupTitleLabel()
        setupActionButton()
        setupMessageLabel()
    }
}
