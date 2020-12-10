//
//  AccountViewModel.swift
//  Appetizers
//
//  Created by Fito Toledano on 12/10/20.
//

import SwiftUI

final class AccountViewModel: ObservableObject {
    
    @Published var user = User()
    @Published var alertItem: AlertItem?
    
    var isValidForm: Bool {
        guard !user.firstName.isEmpty || !user.lastName.isEmpty || !user.email.isEmpty else {
            print("Showing empty Field alert.")
            alertItem = AlertContext.emptyTextFieldInForm
            return false
        }
        
        guard user.email.isValidEmail else {
            print("Showing Invalid Email alert.")
            alertItem = AlertContext.invalidEmail
            return false
        }
        
        return true
    }
    
    func saveData() {
        if !isValidForm  {
            print("Error. Form is invalid.")
        } else {
            print("Saved Data.")
        }
    }
}
