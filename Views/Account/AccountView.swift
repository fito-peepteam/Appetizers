//
//  AccountView.swift
//  Appetizers
//
//  Created by Fito Toledano on 12/7/20.
//

import SwiftUI

struct AccountView: View {
    
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var email: String = ""
    @State private var birthday: Date = Date()
    @State private var extraNapkins: Bool = false
    @State private var frequentRefills: Bool = false
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Personal Info")) {
                    TextField("First Name", text: $firstName)
                    TextField("Last Name", text: $lastName)
                    TextField("Email", text: $email)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        .keyboardType(.emailAddress)
                    
                    DatePicker("Birthday", selection: $birthday, displayedComponents: .date)
                    Button {
                        print("Save")
                    } label: {
                        Text("Save changes")
                    }
                }
                
                Section (header: Text("Requests")) {
                    Toggle("Extra napkins", isOn: $extraNapkins)
                    Toggle("Frequent Refills", isOn: $frequentRefills)
                }
                .toggleStyle(SwitchToggleStyle(tint: .brandPrimary))
                
            }
            .navigationTitle(Text("Account"))
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
