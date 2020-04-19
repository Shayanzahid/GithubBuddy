//
//  GBBodyLabel.swift
//  GithubBuddy
//
//  Created by Shayan Zahid on 12/04/2020.
//  Copyright © 2020 Shayan Zahid. All rights reserved.
//

import UIKit

class GBBodyLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    init(textAlignment: NSTextAlignment) {
        super.init(frame: .zero)
        
        self.textAlignment = textAlignment
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        
        textColor = .secondaryLabel
        font = UIFont.preferredFont(forTextStyle: .body)
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.75
        lineBreakMode = .byWordWrapping
    }
}
