//
//  AccountViewModel.swift
//  Appetizers
//
//  Created by Fito Toledano on 12/10/20.
//

import SwiftUI

final class AccountViewModel: ObservableObject {
    
    @AppStorage("user") private var userData: Data?
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
    
    func retrieveUser() {
        guard let userData = userData else { return } // this can be the fresh launch. we're letting it show as blank, so the user can fill it up.
        
        do {
            user = try JSONDecoder().decode(User.self, from: userData)
        } catch {
            self.alertItem = AlertContext.invalidUserData
        }
    }
    
    func saveData() {
        
        guard isValidForm else { return }
        
        do {
            let data = try JSONEncoder().encode(user)
            userData = data
            self.alertItem = AlertContext.successSavingUserData
        } catch {
            print(error.localizedDescription)
            self.alertItem = AlertContext.invalidUserData
        }
    }
}
