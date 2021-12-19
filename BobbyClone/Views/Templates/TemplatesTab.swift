//
//  TemplatesTab.swift
//  BobbyClone
//
//  Created by Antoine De Roose on 18/12/2021.
//

import SwiftUI

struct TemplatesTab: View {
  
  @Binding var isShowingSubscriptionTemplatesSheet: Bool
  let popularOnly: Bool
  
  var body: some View {
    ScrollView {
      VStack {
        ForEach(templates) { template in
          if template.isPopular || !popularOnly {
            NavigationLink(destination: SubscriptionCreationView(isShowingSubscriptionTemplatesSheet: $isShowingSubscriptionTemplatesSheet, template: template)) {
              HStack {
                Image(systemName: template.iconString)
                  .foregroundColor(getBorderColor(colorHex: template.colorHex) ?? .primary)
                  .font(.title)
                  .padding(.trailing, 8)
                Text(template.name)
                  .foregroundColor(getBorderColor(colorHex: template.colorHex) ?? .primary)
                  .font(.headline)
                  .fontWeight(.semibold)
                Spacer()
                Image(systemName: "plus")
                  .foregroundColor(getBorderColor(colorHex: template.colorHex) ?? .primary)
                  .font(.title2)
              }
              .padding()
              .overlay(
                  RoundedRectangle(cornerRadius: 6)
                    .strokeBorder(getBorderColor(colorHex: template.colorHex) ?? .primary)
              )
              .padding(.horizontal)
              .padding(.vertical, 2)
            }
          }
        }
      }
      .padding(.vertical, 12)
    }
  }
  
  private func getBorderColor(colorHex: String?) -> Color? {
    return colorHex == nil ? nil : Color(hex: colorHex!)
  }
  
}

struct TemplatesTab_Previews: PreviewProvider {
  @State static var showSheet = true
  static var previews: some View {
    Group {
      TemplatesTab(isShowingSubscriptionTemplatesSheet: $showSheet, popularOnly: true)
      TemplatesTab(isShowingSubscriptionTemplatesSheet: $showSheet, popularOnly: false)
    }
  }
}
