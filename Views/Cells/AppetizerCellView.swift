//
//  AppetizerCellView.swift
//  Appetizers
//
//  Created by Fito Toledano on 12/8/20.
//

import SwiftUI

struct AppetizerCellView: View {
    
    let appetizer: Appetizer
    
    var body: some View {
        HStack {
            AppetizerRemoteImage(urlString: appetizer.imageURL)
                .cornerRadius(10)
                .frame(width: 120, height: 100)
                .padding()
            
            VStack (alignment: .leading, spacing: 8){
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.bold)
                Text("$\(appetizer.price/2, specifier: "%.2f")")
                    .foregroundColor(.secondary)
                    .fontWeight(.semibold)
            }
            .padding()
        }
    }
}

struct AppetizerCellView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerCellView(appetizer: MockData.sampleAppetizer)
    }
}
