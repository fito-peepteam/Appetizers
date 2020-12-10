//
//  CartView.swift
//  Appetizers
//
//  Created by Fito Toledano on 12/10/20.
//

import SwiftUI

struct CartView: View {
    
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    List {
                        ForEach(order.items) { appetizer in
                            AppetizerCellView(appetizer: appetizer)
                        }
                        .onDelete { indexSet in
                            self.order.deleteItem(at: indexSet)
                        }
                    }
                    .listStyle(PlainListStyle())
                    
                    
                    Button {
                        print("Order placed.")
                    } label: {
                        ButtonLabel(title: "$\(order.totalPrice/2, specifier: "%.2f") - Order")
                    }.padding()
                }
                if order.items.isEmpty {
                    EmptyState(imageName: "empty-order", message: "Your cart is empty.")
                }
            }
            .navigationTitle("Cart")
        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}
