//
//  SubscriptionFormTopView.swift
//  BobbyClone
//
//  Created by Antoine De Roose on 13/12/2021.
//
// HStack with equal spacing : https://stackoverflow.com/questions/56620499/equal-widths-of-subviews-with-swiftui

import SwiftUI

struct SubscriptionFormTopView: View {
  
  @Binding var subscriptionConfig: SubscriptionConfig
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
        Text(subscriptionConfig.name)
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
    .foregroundColor(subscriptionConfig.colorHex == nil ? .primary : .white)
    .background(subscriptionConfig.colorHex == nil ? Color(uiColor: .systemBackground) : Color(hex: subscriptionConfig.colorHex!))
  }
}

struct SubscriptionFormTopView_Previews: PreviewProvider {
  @State static var subscriptionConfig = SubscriptionConfig()
  static var previews: some View {
    SubscriptionFormTopView(subscriptionConfig: $subscriptionConfig, onSave: {
      print("saving...")
    })
  }
}
