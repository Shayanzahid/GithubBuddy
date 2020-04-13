//
//  Extension+UIViewController.swift
//  GithubBuddy
//
//  Created by Shayan Zahid on 08/04/2020.
//  Copyright © 2020 Shayan Zahid. All rights reserved.
//

import UIKit

extension UIViewController {
    func hidesKeyboardOnTap() {
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
    
    func presentGBAlert(title: String, message: String, buttonTitle: String) {
        DispatchQueue.main.async {
            let alert = AlertVC(title: title, message: message, buttonTitle: buttonTitle)
            alert.modalPresentationStyle = .overFullScreen
            alert.modalTransitionStyle = .crossDissolve
            self.present(alert, animated: true)
        }
    }
}


