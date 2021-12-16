//
//  OptionalDatePicker.swift
//  BobbyClone
//
//  Created by Antoine De Roose on 15/12/2021.
//

import SwiftUI

/// This view enables to do something impossible in SwiftUI 3 : use a DatePicker with an optional date.
/// This view can be used like a regular DatePicker, but when the Date? is nil, it displays a view similar to a TextField.
/// When the fake TextField, wich is just a text, is tapped, a regular DatePicker is presented.
///
/// Warning, as soon as the TextField is tapped, the Date? is setted to a value (typically the date of today).
/// This could be improved if necessary.
struct OptionalDatePicker<Content: View>: View {
  
  @Binding var selection: Date?
  var range: PartialRangeThrough<Date>
  var displayedComponents: DatePicker<Text>.Components = [.date, .hourAndMinute]
  var prompt: String = "Date (not required)"
  @ViewBuilder var content: Content
  
  @State private var selectedDate = Date()
  @State private var displayFirstBillingDatePicker = false
  
  var body: some View {
    if selection == nil && !displayFirstBillingDatePicker {
      HStack {
        content
        Spacer()
        Text(prompt)
          .foregroundColor(Color(uiColor: .tertiaryLabel))
          .onTapGesture { displayFirstBillingDatePicker = true }
      }
    } else {
      DatePicker(selection: $selectedDate, in: range, displayedComponents: displayedComponents) {
        content
      }
      .onAppear(perform: {
        if let selection = selection {
          selectedDate = selection
        } else {
          let today = Date()
          selectedDate = today
          selection = today
        }
      })
      .onChange(of: selectedDate) { newValue in
        selection = newValue
      }
    }
  }
}

struct OptionalDatePicker_Previews: PreviewProvider {
  @State static var date: Date? = nil
  static var previews: some View {
    Group {
      OptionalDatePicker(selection: $date, range: ...Date(), displayedComponents: .date) {
        Text("Mon picker")
          .preferredColorScheme(.light)
      }
      OptionalDatePicker(selection: $date, range: ...Date(), displayedComponents: .date) {
        Text("Mon picker")
      }
      .preferredColorScheme(.dark)
    }
    .previewLayout(.sizeThatFits)
    .padding()
  }
}
