//
//  AppetizerDetailView.swift
//  Appetizers
//
//  Created by Fito Toledano on 12/9/20.
//

import SwiftUI

struct AppetizerDetailView: View {
    
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
                    VStack (spacing: 5) {
                        Text("Calories")
                            .bold()
                            .font(.caption)
                        Text("\(appetizer.calories)")
                            .foregroundColor(.secondary)
                            .fontWeight(.semibold)
                    }
                    
                    VStack (spacing: 5) {
                        Text("Carbs")
                            .bold()
                            .font(.caption)
                        Text("\(appetizer.carbs) g")
                            .foregroundColor(.secondary)
                            .fontWeight(.semibold)
                    }
                    
                    VStack (spacing: 5) {
                        Text("Protein")
                            .bold()
                            .font(.caption)
                        Text("\(appetizer.protein) g")
                            .foregroundColor(.secondary)
                            .fontWeight(.semibold)
                    }
                }
            }
            
            Spacer()
            
            Button(action: {
                isShowingDetail = false
            }, label: {
                Text("$\(appetizer.price/2, specifier: "%.2f") -  Order")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .frame(width: 260, height: 50)
                    .foregroundColor(.white)
                    .background(Color.brandPrimary)
                    .cornerRadius(10)
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
            ZStack {
                Circle()
                    .frame(width: 30, height: 30)
                    .foregroundColor(.white)
                    .opacity(0.6)
                    .padding()
                Image(systemName: "xmark")
                    .imageScale(.small)
                    .foregroundColor(.secondary)
                    .frame(width: 44, height: 44)
            }
        }), alignment: .topTrailing)
    }
}

struct AppetizerDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerDetailView(appetizer: MockData.sampleAppetizer, isShowingDetail: .constant(true))
    }
}
