//
//  AlertView.swift
//  GithubBuddy
//
//  Created by Shayan Zahid on 12/04/2020.
//  Copyright © 2020 Shayan Zahid. All rights reserved.
//

import UIKit

class AlertView: UIView {
    var alertVC: AlertVC? {
        didSet {
            customAlert.actionButton.addTarget(alertVC, action: #selector(AlertVC.actionButtonTapped), for: .touchUpInside)
            
            let tap = UITapGestureRecognizer(target: alertVC, action: #selector(AlertVC.dismissVC))
            addGestureRecognizer(tap)
        }
    }
    
    var customAlert = GBAlertView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.75)
        
        setupScreen()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCustomAlert() {
        addSubview(customAlert)
        
        NSLayoutConstraint.activate([
            customAlert.centerXAnchor.constraint(equalTo: centerXAnchor),
            customAlert.centerYAnchor.constraint(equalTo: centerYAnchor),
            customAlert.heightAnchor.constraint(equalToConstant: 220),
            customAlert.widthAnchor.constraint(equalToConstant: 280)
        ])
    }
    
    private func setupScreen() {
        setupCustomAlert()
    }
}
