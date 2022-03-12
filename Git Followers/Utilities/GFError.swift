//
//  GFError.swift
//  Git Followers
//
//  Created by Admin on 3/9/22.
//

import Foundation

enum GFError : String, Error {
    case invalidUsername = "This username created an invalid request."
    case unableToComplete = "Unable to complete your request. Please check internet connection."
    case invalidResponse = "Invalid response from the server. try again"
    case invalidData = "The data received from the server was invalid. "
    case unableToFavorite = "The was an error favorited data. Please try again"
    case alreadyInFavorites = "User already in favorites"
}
