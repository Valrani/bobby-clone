//
//  DecimalField.swift
//  BobbyClone
//
//  Created by Antoine De Roose on 17/12/2021.
//
//  Inspired by: https://stackoverflow.com/questions/58733003/swiftui-how-to-create-textfield-that-only-accepts-numbers/58736068#58736068

import SwiftUI
import Combine

struct DecimalField: View {
  
  @Binding var double: Double
  
  @State private var precedentDecimalString = ""
  @State private var decimalString = ""
  
  var body: some View {
    TextField("Total number of people", text: $decimalString, prompt: Text("0.00"))
      .keyboardType(.decimalPad)
      .onAppear {
        decimalString = String(format: "%.2f", self.double)
        precedentDecimalString = String(format: "%.2f", self.double)
      }
      .onReceive(Just(decimalString)) { newValue in
        // Ensure the presence of non-numbers characters
        let filtered = newValue.filter { "0123456789,.".contains($0) }
        if filtered != newValue {
          self.decimalString = filtered
        }
        // Ensure that only one separator character
        var nb = 0
        for character in filtered {
          if character == "," || character == "." {
            nb += 1
          }
        }
        if (nb > 1) {
          self.decimalString = precedentDecimalString
        }
        // Ensure maximum 2 digits after separator
        let splitted = self.decimalString.replacingOccurrences(of: ",", with: ".").split(separator: ".")
        if splitted.count > 1 && splitted[1].count > 2 {
          self.decimalString = precedentDecimalString
        }
        
        if let double = Double(self.decimalString.replacingOccurrences(of: ",", with: ".")) {
          self.double = double
        }
        self.precedentDecimalString = self.decimalString
      }
  }
}

struct NumberField_Previews: PreviewProvider {
  @State static var price: Double = 0.99
  static var previews: some View {
    DecimalField(double: $price)
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
