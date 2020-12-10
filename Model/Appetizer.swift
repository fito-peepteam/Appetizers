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
    // MARK: - AppetizerCellView
    static let sampleAppetizer = Appetizer(id: 0001,
                                           name: "Calamari",
                                           description: "Calamari is a typical dish from Madrid, Spain.",
                                           imageURL: "",
                                           price: 999,
                                           calories: 100,
                                           carbs: 5,
                                           protein: 12)
    
    static let appetizers = [sampleAppetizer, sampleAppetizer, sampleAppetizer, sampleAppetizer, sampleAppetizer]
    
    // MARK: - CartView
    static let sampleCartItems = [sampleCartItem, sampleCartItem2, sampleCartItem3, sampleCartItem4, sampleCartItem5]
    static let sampleCartItem = Appetizer(id: 0001,
                                           name: "Calamari",
                                           description: "Calamari is a typical dish from Madrid, Spain.",
                                           imageURL: "",
                                           price: 999,
                                           calories: 100,
                                           carbs: 5,
                                           protein: 12)
    
    static let sampleCartItem2 = Appetizer(id: 0002,
                                           name: "Calamari",
                                           description: "Calamari is a typical dish from Madrid, Spain.",
                                           imageURL: "",
                                           price: 999,
                                           calories: 100,
                                           carbs: 5,
                                           protein: 12)
    
    static let sampleCartItem3 = Appetizer(id: 0003,
                                           name: "Calamari",
                                           description: "Calamari is a typical dish from Madrid, Spain.",
                                           imageURL: "",
                                           price: 999,
                                           calories: 100,
                                           carbs: 5,
                                           protein: 12)
    
    static let sampleCartItem4 = Appetizer(id: 0004,
                                           name: "Calamari",
                                           description: "Calamari is a typical dish from Madrid, Spain.",
                                           imageURL: "",
                                           price: 999,
                                           calories: 100,
                                           carbs: 5,
                                           protein: 12)
    
    static let sampleCartItem5 = Appetizer(id: 0005,
                                           name: "Calamari",
                                           description: "Calamari is a typical dish from Madrid, Spain.",
                                           imageURL: "",
                                           price: 999,
                                           calories: 100,
                                           carbs: 5,
                                           protein: 12)
    
    
    
   
}
