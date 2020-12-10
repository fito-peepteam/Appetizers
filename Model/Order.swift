//
//  Order.swift
//  Appetizers
//
//  Created by Fito Toledano on 12/10/20.
//

import SwiftUI

final class Order: ObservableObject {
    
    @Published var items: [Appetizer] = [] {
        didSet {
            print(items)
        }
    }
    
    var totalPrice: Double {
        items.reduce(0) { $0 + $1.price }
    }
    
    func addToCart(_ appetizer: Appetizer) {
        items.append(appetizer)
    }
    
    func deleteItem(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }
    
    
}
