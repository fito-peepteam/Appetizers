//
//  AppetizerDetailView.swift
//  Appetizers
//
//  Created by Fito Toledano on 12/9/20.
//

import SwiftUI

struct AppetizerDetailView: View {
    
    @EnvironmentObject var order: Order
    
    let appetizer: Appetizer
    @Binding var isShowingDetail: Bool
    
    var body: some View {
        VStack {
            AppetizerRemoteImage(urlString: appetizer.imageURL)
                .frame(width: 320, height: 200)
                .aspectRatio(contentMode: .fill)
            
            VStack {
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                Text(appetizer.description)
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .padding()
                
                HStack (spacing: 40) {
                    NutritionalValueView(title: "Calories", value: appetizer.calories)
                    NutritionalValueView(title: "Carbs", value: appetizer.carbs)
                    NutritionalValueView(title: "Protein", value: appetizer.protein)
                }
            }
            
            Spacer()
            
            Button(action: {
                order.addToCart(appetizer)
                isShowingDetail = false
            }, label: {
                ButtonLabel(title: "$\(appetizer.price/2, specifier: "%.2f") -  Order")
            })
            .padding()
        }
        .frame(width: 320, height: 525)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
        .overlay(Button(action: {
            isShowingDetail = false
        }, label: {
            XDismissButton()
        }), alignment: .topTrailing)
    }
}

struct AppetizerDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerDetailView(appetizer: MockData.sampleAppetizer, isShowingDetail: .constant(true))
    }
}
