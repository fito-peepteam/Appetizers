//
//  NutritionalValues.swift
//  Appetizers
//
//  Created by Fito Toledano on 12/9/20.
//

import SwiftUI

struct NutritionalValueView: View {
    
    let title: String
    let value: Int
    
    var body: some View {
        VStack (spacing: 5) {
            Text(title)
                .bold()
                .font(.caption)
            Text("\(value)")
                .foregroundColor(.secondary)
                .fontWeight(.semibold)
        }
    }
}

struct NutritionalValues_Previews: PreviewProvider {
    static var previews: some View {
        NutritionalValueView(title: "Calories", value: MockData.sampleAppetizer.calories)
    }
}
