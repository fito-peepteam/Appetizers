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
    
    var isValidForm: Bool {
        guard !firstName.isEmpty || !lastName.isEmpty || !email.isEmpty else {
            // show alert
            return false
        }
        
        guard email.isValidEmail else {
            
            return false
        }
        
        return true
    }
}
