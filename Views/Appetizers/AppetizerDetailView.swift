//
//  AppetizerDetailView.swift
//  Appetizers
//
//  Created by Fito Toledano on 12/9/20.
//

import SwiftUI

struct AppetizerDetailView: View {
    
    let appetizer: Appetizer
    
    var body: some View {
        VStack {
            ZStack (alignment: Alignment(horizontal: .trailing, vertical: .top)) {
                AppetizerRemoteImage(urlString: appetizer.imageURL)
                    .frame(minWidth: .infinity, minHeight: 200, alignment: .topTrailing)
                Image(systemName: "xmark.circle.fill")
            }
            Text(appetizer.name)
            Text(appetizer.description)
            
            HStack {
                VStack {
                    Text("Calories")
                    Text("\(appetizer.calories)")
                }
                
                VStack {
                    Text("Carbs")
                    Text("\(appetizer.carbs) g")
                }
                
                VStack {
                    Text("Protein")
                    Text("\(appetizer.protein) g")
                }
            }
            
            Button(action: {
                print("Tapped add to order button.")
            }, label: {
                Text("$\(appetizer.price) - Order")
                    .foregroundColor(.white)
                    .font(.title2)
                    .fontWeight(.bold)
                    .frame(width: 200, height: 50)
                    .background(Color.brandPrimary)
                    .cornerRadius(10)
            })
        }
        .frame(width: 320, height: 525)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
    }
}

struct AppetizerDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerDetailView(appetizer: MockData.sampleAppetizer)
    }
}
