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
    Subscription(name: "PS+", price: 50, iconString: "plus", colorHex: "#00A1FF", firstBilling: _2020_01_01, billingCycleNumber: 1, billingCycleTimeUnit: .year),
    Subscription(name: "Notion", price: 4, iconString: "questionmark.square", colorHex: "#B0B0B0", firstBilling: _2021_12_08, billingCycleNumber: 1, billingCycleTimeUnit: .month),
    Subscription(name: "Netflix", price: 9.99, iconString: "n.circle", colorHex: "#FF3535", billingCycleNumber: 1, billingCycleTimeUnit: .month),
    Subscription(name: "PS+", price: 50, iconString: "plus", colorHex: "#00A1FF", firstBilling: _2020_01_01, billingCycleNumber: 1, billingCycleTimeUnit: .year),
    Subscription(name: "Notion", price: 4, iconString: "questionmark.square", colorHex: "#B0B0B0", firstBilling: _2021_12_08, billingCycleNumber: 1, billingCycleTimeUnit: .month),
    Subscription(name: "Netflix", price: 9.99, iconString: "n.circle", colorHex: "#FF3535", billingCycleNumber: 1, billingCycleTimeUnit: .month),
    Subscription(name: "PS+", price: 50, iconString: "plus", colorHex: "#00A1FF", firstBilling: _2020_01_01, billingCycleNumber: 1, billingCycleTimeUnit: .year),
    Subscription(name: "Notion", price: 4, iconString: "questionmark.square", colorHex: "#B0B0B0", firstBilling: _2021_12_08, billingCycleNumber: 1, billingCycleTimeUnit: .month),
    Subscription(name: "Netflix", price: 9.99, iconString: "n.circle", colorHex: "#FF3535", billingCycleNumber: 1, billingCycleTimeUnit: .month),
    Subscription(name: "PS+", price: 50, iconString: "plus", colorHex: "#00A1FF", firstBilling: _2020_01_01, billingCycleNumber: 1, billingCycleTimeUnit: .year),
    Subscription(name: "Notion", price: 4, iconString: "questionmark.square", colorHex: "#B0B0B0", firstBilling: _2021_12_08, billingCycleNumber: 1, billingCycleTimeUnit: .month),
    Subscription(name: "Netflix", price: 9.99, iconString: "n.circle", colorHex: "#FF3535", billingCycleNumber: 1, billingCycleTimeUnit: .month),
    Subscription(name: "PS+", price: 50, iconString: "plus", colorHex: "#00A1FF", firstBilling: _2020_01_01, billingCycleNumber: 1, billingCycleTimeUnit: .year),
    Subscription(name: "Notion", price: 4, iconString: "questionmark.square", colorHex: "#B0B0B0", firstBilling: _2021_12_08, billingCycleNumber: 1, billingCycleTimeUnit: .month),
    Subscription(name: "Netflix", price: 9.99, iconString: "n.circle", colorHex: "#FF3535", billingCycleNumber: 1, billingCycleTimeUnit: .month),
    Subscription(name: "PS+", price: 50, iconString: "plus", colorHex: "#00A1FF", firstBilling: _2020_01_01, billingCycleNumber: 1, billingCycleTimeUnit: .year),
    Subscription(name: "Notion", price: 4, iconString: "questionmark.square", colorHex: "#B0B0B0", firstBilling: _2021_12_08, billingCycleNumber: 1, billingCycleTimeUnit: .month),
    Subscription(name: "Netflix", price: 9.99, iconString: "n.circle", colorHex: "#FF3535", billingCycleNumber: 1, billingCycleTimeUnit: .month)
  ]
  
}
