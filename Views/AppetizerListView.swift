//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by Fito Toledano on 12/7/20.
//

import SwiftUI

struct AppetizerListView: View {
    var body: some View {
        NavigationView {
            List(MockData.appetizers, id: \.id) { appetizer in
                AppetizerCellView(appetizer: appetizer)
            }
            .navigationTitle("Appetizers")
        }
    }
}

struct AppetizerListView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerListView()
    }
}
