//
//  Subscription.swift
//  BobbyClone
//
//  Created by Antoine De Roose on 10/12/2021.
//
//  DateComponents: https://www.appsdeveloperblog.com/add-days-months-years-to-current-date-in-swift/
//  Calendar byAdding nil: https://stackoverflow.com/questions/39358131/when-does-datebyaddingcomponentstodateoptions-return-nil

import Foundation
import SwiftUI

class Subscription: Identifiable, ObservableObject {
  
  let id: String
  @Published var name: String
  @Published var description: String?
  @Published var price: Double
  @Published var iconString: String
  @Published var colorHex: String?
  @Published var firstBilling: Date?
  @Published var billingCycleNumber: Int
  @Published var billingCycleTimeUnit: TimeUnit
  
  /// Returns next billing, based on first billing.
  /// If it's today, returns today instead.
  var nextBilling: Date? {
    guard let firstBilling = firstBilling?.startOfDay else { return nil }
    var nextDate = firstBilling
    let dateComponent = initDateComponent()
    guard let currentDate = Date().startOfDay else { return nil }
    while nextDate < currentDate {
      guard let calculated = Calendar.current.date(byAdding: dateComponent, to: nextDate) else { return nil }
      nextDate = calculated
    }
    return nextDate
  }
  
  /// Returns the average price per week.
  var pricePerWeek: Double {
    switch billingCycleTimeUnit {
    case .day:
      return price / Double(billingCycleNumber)
    case .week:
      return (price * 7) / Double(billingCycleNumber)
    case .month:
      return (price / Constants.weeksInAMonth) / Double(billingCycleNumber)
    case .year:
      return (price / Constants.weeksInAYear) / Double(billingCycleNumber)
    }
  }
  
  /// Returns a description of the next billing date
  var nextBillingString: String? {
    guard let nextBilling = nextBilling else { return nil }
    guard nextBilling != Date().startOfDay else { return "Aujourd'hui" }
    guard !Calendar.current.isDateInTomorrow(nextBilling) else { return "Demain" }
    let formatter = DateFormatter()
    formatter.dateFormat = "dd/MM/yyyy"
    return formatter.string(from: nextBilling)
  }
  
  init(name: String, description: String? = nil, price: Double, iconString: String, colorHex: String? = nil, firstBilling: Date? = nil, billingCycleNumber: Int, billingCycleTimeUnit: TimeUnit) {
    self.id = UUID().uuidString
    self.name = name
    self.description = description
    self.price = price
    self.iconString = iconString
    self.colorHex = colorHex
    self.firstBilling = firstBilling
    self.billingCycleNumber = billingCycleNumber
    self.billingCycleTimeUnit = billingCycleTimeUnit
  }
  
  private func initDateComponent() -> DateComponents {
    var dateComponent = DateComponents()
    switch billingCycleTimeUnit {
    case .day:
      dateComponent.day = billingCycleNumber
    case .week:
      dateComponent.weekOfYear = billingCycleNumber
    case .month:
      dateComponent.month = billingCycleNumber
    case .year:
      dateComponent.year = billingCycleNumber
    }
    return dateComponent;
  }
  
}
