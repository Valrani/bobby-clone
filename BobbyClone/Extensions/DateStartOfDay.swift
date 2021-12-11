//
//  DateStartOfDay.swift
//  BobbyClone
//
//  Created by Antoine De Roose on 11/12/2021.
//
//  Source: https://stackoverflow.com/a/57808433

import Foundation

extension Date {

    var startOfDay: Date? {
        let calendar = Calendar.current

        var components = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: self)

        components.hour = 0
        components.minute = 0
        components.second = 0

        return calendar.date(from: components)
    }

}
