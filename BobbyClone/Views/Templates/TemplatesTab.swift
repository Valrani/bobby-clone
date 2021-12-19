//
//  TemplatesTab.swift
//  BobbyClone
//
//  Created by Antoine De Roose on 18/12/2021.
//

import SwiftUI

struct TemplatesTab: View {
  
  let popularOnly: Bool
  
  var body: some View {
    ScrollView {
      VStack {
        ForEach(templates) { template in
          if template.isPopular || !popularOnly {
            NavigationLink(destination: SubscriptionCreationView(template: template)) {
              HStack {
                Image(systemName: template.iconString)
                  .foregroundColor(template.colorHex == nil ? Color.primary : Color(hex: template.colorHex!))
                  .font(.title)
                  .padding(.trailing, 8)
                Text(template.name)
                  .foregroundColor(template.colorHex == nil ? Color.primary : Color(hex: template.colorHex!))
                  .font(.headline)
                  .fontWeight(.semibold)
                Spacer()
                Image(systemName: "plus")
                  .foregroundColor(template.colorHex == nil ? Color.primary : Color(hex: template.colorHex!))
                  .font(.title2)
              }
              .padding()
              .background(
                RoundedRectangle(cornerRadius: 6)
                  .strokeBorder(Color.primary)
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
}

struct TemplatesTab_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      TemplatesTab(popularOnly: true)
      TemplatesTab(popularOnly: false)
    }
  }
}
