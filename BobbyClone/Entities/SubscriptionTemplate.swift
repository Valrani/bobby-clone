//
//  SubscriptionTemplate.swift
//  BobbyClone
//
//  Created by Antoine De Roose on 10/12/2021.
//

import Foundation

struct SubscriptionTemplate: Identifiable {
  
  let id: String
  let name: String
  let iconString: String
  let colorHexa: String
  let isPopular: Bool
  
  init(name: String, iconString: String, colorHexa: String, isPopular: Bool) {
    self.id = UUID().uuidString
    self.name = name
    self.iconString = iconString
    self.colorHexa = colorHexa
    self.isPopular = isPopular
  }
  
}
