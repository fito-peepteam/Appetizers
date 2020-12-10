//
//  OrderViewModel.swift
//  Appetizers
//
//  Created by Fito Toledano on 12/10/20.
//

import SwiftUI

final class CartViewModel: ObservableObject {
    
    @Published var Cart = [Appetizer]()
    
    func addToCart(appetizer: Appetizer) {
        Cart.append(appetizer)
    }
    
    func clearCart() {
        self.Cart.removeAll()
    }
}
