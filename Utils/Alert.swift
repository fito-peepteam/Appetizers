//
//  Alert.swift
//  Appetizers
//
//  Created by Fito Toledano on 12/8/20.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

struct AlertContext {
    
    // MARK: - Account View Alerts
    static let invalidName = AlertItem(title: Text("Invalid Name"),
                                       message: Text("Please enter a valid name."),
                                       dismissButton: .default(Text("Ok")))
    static let invalidEmail = AlertItem(title: Text("Invalid Email"),
                                        message: Text("Please enter a valid email."),
                                        dismissButton: .default(Text("Ok")))
    static let emptyTextFieldInForm = AlertItem(title: Text("Fill it up"),
                                                message: Text("Please make sure you entered all the necessary data."),
                                                dismissButton: .default(Text("Ok")))
    
    
    // MARK: - Networking Call Alerts
    static let invalidUrl = AlertItem(title: Text("Invalid URL"),
                                      message: Text(ALError.invalidUrl.rawValue),
                                      dismissButton: .default(Text("Ok")))
    
    static let invalidResponse = AlertItem(title: Text("Invalid Response"),
                                           message: Text(ALError.invalidResponse.rawValue),
                                           dismissButton: .default(Text("Ok")))
    
    static let invalidData = AlertItem(title: Text("Invalid Data"),
                                       message: Text(ALError.invalidData.rawValue),
                                       dismissButton: .default(Text("Ok")))
    
    static let unabeToComplete = AlertItem(title: Text("Uh-Oh URL"),
                                           message: Text(ALError.unableToComplete.rawValue),
                                           dismissButton: .default(Text("Ok")))
}
