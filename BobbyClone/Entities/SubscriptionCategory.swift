//
//  SubscriptionCategory.swift
//  BobbyClone
//
//  Created by Antoine De Roose on 10/12/2021.
//

import Foundation

class SubscriptionCategory: Identifiable {
    
    let id: String
    var name: String
    
    init(name: String) {
        self.id = UUID().uuidString
        self.name = name
    }
    
}
