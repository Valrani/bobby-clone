//
//  NilWhenEmpty.swift
//  HabitTracker
//
//  Created by Antoine De Roose on 05/12/2021.
//

import Foundation

extension Optional where Wrapped == String {
    
    /// Returns nil if the value is an empty String.
    var nilWhenEmpty: String? {
        if let value = self {
            return value.isEmpty ? nil : value
        }
        return nil
    }
    
}
