//
//  Date+Ext.swift
//  Appetizers
//
//  Created by Fito Toledano on 12/10/20.
//

import SwiftUI

extension Date {
    var fourteenYearsAgo: Date {
        let date = Calendar.current.date(byAdding: .year, value: -14, to: Date())!
        return date
    }
    
    var oneHundredYearsAgo: Date {
        let date = Calendar.current.date(byAdding: .year, value: -100, to: Date())!
        return date
    }
}
