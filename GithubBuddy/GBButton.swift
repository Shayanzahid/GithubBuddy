//
//  GBButton.swift
//  GithubBuddy
//
//  Created by Shayan Zahid on 05/04/2020.
//  Copyright © 2020 Shayan Zahid. All rights reserved.
//

import UIKit

class GBButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)

        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(backgroundColor: UIColor, title: String) {
        super.init(frame: .zero)

        self.backgroundColor = backgroundColor
        self.setTitle(title, for: .normal)
        setup()
    }
    
    private func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        
        layer.cornerRadius = 10
        titleLabel?.textColor = .white
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
    }
}
