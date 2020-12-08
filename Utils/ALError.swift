//
//  ALError.swift
//  Appetizers
//
//  Created by Fito Toledano on 12/8/20.
//

import Foundation

enum ALError: String, Error {
    case invalidUrl = "There is an error with the URL. Please, try again later."
    case invalidResponse = "Received an invalid response from the server. Please, try again."
    case invalidData = "The data received from the server is invalid. Please, try again."
    case unableToComplete = "We were unable to complete your request. Please, try again later."
}
