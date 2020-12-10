//
//  User.swift
//  Appetizers
//
//  Created by Fito Toledano on 12/10/20.
//

import Foundation

struct User: Codable {
    var firstName: String = ""
    var lastName: String = ""
    var email: String = ""
    var birthdate = Date()
    var extraNapkins: Bool = false
    var frequentRefills: Bool = false
}
