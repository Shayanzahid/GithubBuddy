//
//  AlertVC.swift
//  GithubBuddy
//
//  Created by Shayan Zahid on 12/04/2020.
//  Copyright © 2020 Shayan Zahid. All rights reserved.
//

import UIKit

class AlertVC: UIViewController {
    private let alertView = AlertView()
    
    lazy var alert = alertView.customAlert
    
    override func loadView() {
        super.loadView()
        
        alertView.alertVC = self
        view = alertView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    init(title: String, message: String, buttonTitle: String) {
        super.init(nibName: nil, bundle: nil)
        
        alert.titleLabel.text = title
        alert.messageLabel.text = message
        alert.actionButton.setTitle(buttonTitle, for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func actionButtonTapped() {
        dismissVC()
    }
    
    @objc func dismissVC() {
        dismiss(animated: true)
    }
}
