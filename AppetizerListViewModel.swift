//
//  AppetizerListViewModel.swift
//  Appetizers
//
//  Created by Fito Toledano on 12/8/20.
//

import Foundation

final class AppetizerListViewModel: ObservableObject {
    
    @Published var appetizers: [Appetizer] = []
    
    func fetchAppetizers() {
        print("Loading appetizers...")
        NetworkManager.shared.fetchAppetizers { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let appetizers):
                    print("Succeeded. Publishing changes.")
                    self.appetizers = appetizers
                case .failure(let error):
                    print("Something went wrong", error.rawValue)
                }
            }
        }
    }
    
}
