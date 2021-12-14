//
//  Template.swift
//  BobbyClone
//
//  Created by Antoine De Roose on 10/12/2021.
//

import Foundation

struct Template: Identifiable {
  
  let id: String
  let name: String
  let iconString: String
  let colorHex: String
  let isPopular: Bool
  
  init(name: String, iconString: String, colorHex: String, isPopular: Bool) {
    self.id = UUID().uuidString
    self.name = name
    self.iconString = iconString
    self.colorHex = colorHex
    self.isPopular = isPopular
  }
  
}
