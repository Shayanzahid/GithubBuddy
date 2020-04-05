//
//  SearchView.swift
//  GithubBuddy
//
//  Created by Shayan Zahid on 05/04/2020.
//  Copyright © 2020 Shayan Zahid. All rights reserved.
//

import UIKit

class SearchView: UIView {
    let logoImage = UIImageView()
    let usernameTextField = GBTextField()
    let callToActionButton = GBButton(backgroundColor: .systemGreen, title: "Get followers")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .systemBackground
        
        setupScreen()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLogoImage() {
        addSubview(logoImage)
        
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        logoImage.image = #imageLiteral(resourceName: "gh-logo")
        
        NSLayoutConstraint.activate([
            logoImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 80),
            logoImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            logoImage.heightAnchor.constraint(equalToConstant: 200),
            logoImage.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    private func setupUsernameTextField() {
        addSubview(usernameTextField)
        
        NSLayoutConstraint.activate([
            usernameTextField.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 48),
            usernameTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
            usernameTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50),
            usernameTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func setupCallToActionButton() {
        addSubview(callToActionButton)
        
        NSLayoutConstraint.activate([
            callToActionButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -50),
            callToActionButton.leadingAnchor.constraint(equalTo: usernameTextField.leadingAnchor),
            callToActionButton.trailingAnchor.constraint(equalTo: usernameTextField.trailingAnchor),
            callToActionButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func setupScreen() {
        setupLogoImage()
        setupUsernameTextField()
        setupCallToActionButton()
    }
}
