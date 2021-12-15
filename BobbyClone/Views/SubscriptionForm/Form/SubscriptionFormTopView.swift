//
//  SubscriptionFormTopView.swift
//  BobbyClone
//
//  Created by Antoine De Roose on 13/12/2021.
//
// HStack with equal spacing : https://stackoverflow.com/questions/56620499/equal-widths-of-subviews-with-swiftui

import SwiftUI

struct SubscriptionFormTopView: View {
  
  let name: String
  let onSave: () -> Void
  
  @Environment(\.dismiss) private var dismissSubscriptionEditionView
  
  var body: some View {
    VStack(spacing: 0) {
      HStack {
        Button(action: { dismissSubscriptionEditionView() }) {
          Image(systemName: "chevron.down")
            .font(Font.body.weight(.semibold))
        }
        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
        Text(name)
          .fontWeight(.semibold)
          .frame(minWidth: 0, maxWidth: .infinity)
          .lineLimit(1)
        Button(action: onSave) {
          Text("Enregistrer")
            .fontWeight(.semibold)
        }
        .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
      }
      .padding()
      LineSeparator(color: .white)
    }
  }
}

struct SubscriptionFormTopView_Previews: PreviewProvider {
  static var previews: some View {
    SubscriptionFormTopView(name: "Test", onSave: {
      print("Prout")
    })
  }
}
