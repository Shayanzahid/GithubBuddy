//
//  String+Extension.swift
//  GithubBuddy
//
//  Created by Shayan Zahid on 19/04/2020.
//  Copyright © 2020 Shayan Zahid. All rights reserved.
//

import Foundation

extension String {
    var url: URL {
        return URL(string: self)!
    }
}
