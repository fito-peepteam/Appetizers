//
//  Appetizer.swift
//  Appetizers
//
//  Created by Fito Toledano on 12/8/20.
//

import Foundation

struct Appetizer: Decodable, Identifiable {
    let id: Int
    let name: String
    let description: String
    let imageURL: String
    let price: Double
    let calories: Int
    let carbs: Int
    let protein: Int
}

struct AppetizerResponse: Decodable {
    let request: [Appetizer]
}

struct MockData {
    static let sampleAppetizer = Appetizer(id: 0001,
                                           name: "Calamari",
                                           description: "Calamari is a typical dish from Madrid, Spain.",
                                           imageURL: "",
                                           price: 999,
                                           calories: 100,
                                           carbs: 5,
                                           protein: 12)
    
    static let appetizers = [sampleAppetizer, sampleAppetizer, sampleAppetizer, sampleAppetizer, sampleAppetizer]
}
