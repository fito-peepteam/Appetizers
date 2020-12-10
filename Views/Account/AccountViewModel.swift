//
//  AccountViewModel.swift
//  Appetizers
//
//  Created by Fito Toledano on 12/10/20.
//

import SwiftUI

final class AccountViewModel: ObservableObject {
    
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var email: String = ""
    @Published var birthday: Date = Date()
    @Published var extraNapkins: Bool = false
    @Published var frequentRefills: Bool = false
    @Published var alertItem: AlertItem?
    
    var isValidForm: Bool {
        guard !firstName.isEmpty || !lastName.isEmpty || !email.isEmpty else {
            print("Showing empty Field alert.")
            self.alertItem = AlertContext.emptyTextFieldInForm
            return false
        }
        
        guard email.isValidEmail else {
            print("Showing Invalid Email alert.")
            self.alertItem = AlertContext.invalidEmail
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
