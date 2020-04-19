//
//  GBTitleLabel.swift
//  GithubBuddy
//
//  Created by Shayan Zahid on 12/04/2020.
//  Copyright © 2020 Shayan Zahid. All rights reserved.
//

import UIKit

class GBTitleLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    init(textAlignment: NSTextAlignment, fontSize: CGFloat) {
        super.init(frame: .zero)
        
        self.textAlignment = textAlignment
        self.font = UIFont.boldSystemFont(ofSize: fontSize)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        
        textColor = .label
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.9
        lineBreakMode = .byTruncatingTail
    }
}
