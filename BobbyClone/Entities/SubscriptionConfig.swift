//
//  SubscriptionConfig.swift
//  BobbyClone
//
//  Created by Antoine De Roose on 14/12/2021.
//

import Foundation

/// Holds the information for the creation and edition form, with default values.
struct SubscriptionConfig {

  var iconString = "questionmark"
  var price = 0.00
  var name = ""
  var description = ""
  var colorHex: String? = nil
  var firstBilling: Date? = nil
  var billingCycleNumber = 1
  var billingCycleTimeUnit: TimeUnit = .month

}
