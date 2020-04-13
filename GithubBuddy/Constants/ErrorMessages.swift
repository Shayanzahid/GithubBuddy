//
//  ErrorMessages.swift
//  GithubBuddy
//
//  Created by Shayan Zahid on 14/04/2020.
//  Copyright © 2020 Shayan Zahid. All rights reserved.
//

import Foundation

enum ErrorMessages: String {
    case invalidURL = "This username created an invalid request. Please try again."
    case unableToComplete = "Unable to complete your request. Please check your internet connection."
    case invalidResponse = "Invalid response from the server. Please try again."
    case invalidData = "The data received from the server was invalid. Please try again."
}
