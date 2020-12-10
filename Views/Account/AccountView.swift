//
//  AccountView.swift
//  Appetizers
//
//  Created by Fito Toledano on 12/7/20.
//

import SwiftUI

struct AccountView: View {
    
    @ObservedObject var viewModel = AccountViewModel()
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Personal Info")) {
                    TextField("First Name", text: $viewModel.firstName)
                    TextField("Last Name", text: $viewModel.lastName)
                    TextField("Email", text: $viewModel.email)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        .keyboardType(.emailAddress)
                    
                    DatePicker("Birthday", selection: $viewModel.birthday, displayedComponents: .date)
                    Button {
                        viewModel.saveData()
                    } label: {
                        Text("Save changes")
                    }
                }
                
                Section (header: Text("Requests")) {
                    Toggle("Extra napkins", isOn: $viewModel.extraNapkins)
                    Toggle("Frequent Refills", isOn: $viewModel.frequentRefills)
                }
                .toggleStyle(SwitchToggleStyle(tint: .brandPrimary))
                
            }
            .navigationTitle(Text("Account"))
            .alert(item: $viewModel.alertItem) { alertItem in
                Alert(title: alertItem.title,
                          message: alertItem.message,
                          dismissButton: alertItem.dismissButton)
            }
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
