//
//  BillingCyclePicker.swift
//  BobbyClone
//
//  Created by Antoine De Roose on 17/12/2021.
//
//  https://blckbirds.com/post/swiftui-how-to-create-a-multi-component-picker/
//  Commented code : overlapping bug with iOS 15

import SwiftUI

struct BillingCyclePicker: View {
  
  @Binding var number: Int
  @Binding var timeUnit: TimeUnit
  
//  @State private var prompt = "Chaque"
  private let pickersWidth: CGFloat = 170
  
  var body: some View {
    HStack(spacing: 0) {
//      Picker("Prompt", selection: $prompt) {
//        Text(prompt)
//      }
//      .pickerStyle(.inline)
//      .frame(width: pickersWidth)
//      .compositingGroup()
//      .clipped()
      Picker("Number", selection: $number) {
        ForEach(billingCycleNumbers, id: \.self) { number in
          Text(String(number))
        }
      }
      .pickerStyle(.inline)
      .frame(width: pickersWidth)
      .compositingGroup()
      .clipped()
      Picker("Time Unit", selection: $timeUnit) {
        ForEach(TimeUnit.allCases, id: \.self) { timeUnit in
          Text(displayTimeUnitText(timeUnit: timeUnit))
        }
      }
      .pickerStyle(.inline)
      .frame(width: pickersWidth)
      .compositingGroup()
      .clipped()
    }
  }
  
  private func displayTimeUnitText(timeUnit: TimeUnit) -> String {
    switch timeUnit {
    case .day:
      return "Jour"
    case .week:
      return "Semaine"
    case .month:
      return "Mois"
    case .year:
      return "Année"
    }
  }
  
}

struct BillingCyclePicker_Previews: PreviewProvider {
  @State static var number = 3
  @State static var timeUnit: TimeUnit = .month
  static var previews: some View {
    BillingCyclePicker(number: $number, timeUnit: $timeUnit)
  }
}
