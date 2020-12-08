//
//  AppetizerListViewModel.swift
//  Appetizers
//
//  Created by Fito Toledano on 12/8/20.
//

import Foundation

final class AppetizerListViewModel: ObservableObject {
    
    @Published var appetizers: [Appetizer] = []
    @Published var alertItem: AlertItem?
    
    func fetchAppetizers() {
        print("Loading appetizers...")
        NetworkManager.shared.fetchAppetizers { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let appetizers):
                    print("Succeeded. Publishing changes.")
                    self.appetizers = appetizers
                
                case .failure(let error):
                    print("Something went wrong. Error Value:", error.rawValue)
                    switch error {
                    case .unableToComplete:
                        self.alertItem = AlertContext.unabeToComplete
                        
                    case .invalidUrl:
                        self.alertItem = AlertContext.invalidUrl
                        
                    case .invalidResponse:
                        self.alertItem = AlertContext.invalidResponse
                        
                    case .invalidData:
                        self.alertItem = AlertContext.invalidData
                    }
                }
            }
        }
    }
    
}
