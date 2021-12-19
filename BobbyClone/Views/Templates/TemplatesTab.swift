//
//  TemplatesTab.swift
//  BobbyClone
//
//  Created by Antoine De Roose on 18/12/2021.
//

import SwiftUI

struct TemplatesTab: View {
  
  let popularOnly: Bool
  let onCreateSubscription: (_ template: Template) -> Void
  
  var body: some View {
    ScrollView {
      VStack {
        ForEach(templates) { template in
          if template.isPopular || !popularOnly {
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
              Button(action: { onCreateSubscription(template) }) {
                Image(systemName: "plus")
                  .foregroundColor(template.colorHex == nil ? Color.primary : Color(hex: template.colorHex!))
                  .font(.title2)
              }
            }
            .padding()
            .background(
              RoundedRectangle(cornerRadius: 6)
//                .strokeBorder(template.colorHex == nil ? Color.secondary : Color(hex: template.colorHex!))
                .strokeBorder(Color.primary)
            )
            .padding(.horizontal)
            .padding(.vertical, 2)
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
      TemplatesTab(popularOnly: true, onCreateSubscription: { template in
        print("creating subscription with template \(template.name)...")
      })
      TemplatesTab(popularOnly: false, onCreateSubscription: { template in
        print("creating subscription with template \(template.name)...")
      })
    }
  }
}
