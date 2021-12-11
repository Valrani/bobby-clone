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

class Subscription: Identifiable {
    
    let id: String
    var name: String
    var description: String?
    var price: Double
    var iconString: String
    var colorHexa: String
    var firstBilling: Date?
    var billingCycleNumber: Int
    var billingCycleTimeUnit: TimeUnit
    
    var icon: Image {
        return Image(systemName: iconString)
    }
    
    var color: Color {
        return Color(colorHexa)
    }
    
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
    
    init(name: String, description: String? = nil, price: Double, iconString: String, colorHexa: String, firstBilling: Date? = nil, billingCycleNumber: Int, billingCycleTimeUnit: TimeUnit) {
        self.id = UUID().uuidString
        self.name = name
        self.description = description
        self.price = price
        self.iconString = iconString
        self.colorHexa = colorHexa
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
            dateComponent.weekday = billingCycleNumber
        case .month:
            dateComponent.month = billingCycleNumber
        case .year:
            dateComponent.year = billingCycleNumber
        }
        return dateComponent;
    }
    
}
