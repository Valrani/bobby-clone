//
//  SubscriptionLibrary.swift
//  BobbyClone
//
//  Created by Antoine De Roose on 11/12/2021.
//

import Foundation

private let _2020_01_01 = Date(timeIntervalSince1970: 1577860560)
private let _2021_12_08 = Date(timeIntervalSince1970: 1638939600)

class SubscriptionLibrary: ObservableObject {
  
  @Published var allSubscriptions = [
    Subscription(name: "PlayStation Plus", price: 50, iconString: "plus", colorHex: "#277DA1", firstBilling: _2020_01_01, billingCycleNumber: 1, billingCycleTimeUnit: .year),
    Subscription(name: "Notion", price: 4, iconString: "questionmark.square", colorHex: "#FFFFFF", firstBilling: _2021_12_08, billingCycleNumber: 1, billingCycleTimeUnit: .month),
    Subscription(name: "Netflix", price: 29.99, iconString: "n.circle", colorHex: "#F94144", billingCycleNumber: 3, billingCycleTimeUnit: .month),
    Subscription(name: "Firebase", price: 25, iconString: "flame.fill", colorHex: "#F3722C", billingCycleNumber: 2, billingCycleTimeUnit: .week)
  ]
  
}
