//
//  DateStartOfDay.swift
//  BobbyClone
//
//  Created by Antoine De Roose on 11/12/2021.
//
//  Inspired by: https://stackoverflow.com/a/57808433

import Foundation

extension Date {
  
  /// Set the time of a date to 00:00:00. The timezone is UTC +0000.
  var startOfDay: Date? {
    var calendar = Calendar.current
    guard let timeZone = TimeZone(identifier: "UTC") else { return nil }
    calendar.timeZone = timeZone
    var components = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: self)
    
    components.hour = 0
    components.minute = 0
    components.second = 0
    
    return calendar.date (from: components)
  }
  
}
