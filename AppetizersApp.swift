//
//  AppetizersApp.swift
//  Appetizers
//
//  Created by Fito Toledano on 12/7/20.
//

import SwiftUI

@main
struct AppetizersApp: App {
    
    var order = Order()
    
    var body: some Scene {
        WindowGroup {
            AppetizersTabView().environmentObject(order)
        }
    }
}
