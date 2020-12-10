//
//  OrderViewModel.swift
//  Appetizers
//
//  Created by Fito Toledano on 12/10/20.
//

import SwiftUI

final class CartViewModel: ObservableObject {
    
    @Published var cart = [Appetizer]()
    
    func addToCart(appetizer: Appetizer) {
        cart.append(appetizer)
    }
    
    func clearCart() {
        self.cart.removeAll()
    }
}
