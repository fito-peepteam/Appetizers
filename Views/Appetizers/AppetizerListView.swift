//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by Fito Toledano on 12/7/20.
//

import SwiftUI

struct AppetizerListView: View {
    
    @State var appetizers: [Appetizer]
    
    func fetchAppetizers() {
        NetworkManager.shared.fetchAppetizers { result in
            switch result {
            case .success(let appetizers):
                self.appetizers = appetizers
            case .failure(let error):
                print("Something went wrong", error.rawValue)
            }
        }
    }
    
    var body: some View {
        NavigationView {
            List(appetizers, id: \.id) { appetizer in
                AppetizerCellView(appetizer: appetizer)
            }
            .navigationTitle("Appetizers")
        }
        .onAppear {
            fetchAppetizers()
        }
    }
}

struct AppetizerListView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerListView(appetizers: MockData.appetizers)
    }
}
