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
