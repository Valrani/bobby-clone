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
    VStack {
      ForEach(templates) { template in
        if template.isPopular || !popularOnly {
          TemplateCellView(template: template)
            .padding(.horizontal)
            .padding(.vertical, 2)
        }
      }
    }
  }
}

struct TemplateCellView: View {
  
  let template: Template
  
  var body: some View {
    HStack {
      Image(systemName: template.iconString)
        .foregroundColor(Color(hex: template.colorHex))
        .font(.title)
        .padding(.trailing, 8)
      Text(template.name)
        .foregroundColor(Color(hex: template.colorHex))
        .font(.headline)
        .fontWeight(.semibold)
      Spacer()
      Button(action: {}) {
        Image(systemName: "plus")
          .foregroundColor(Color(hex: template.colorHex))
          .font(.title2)
      }
    }
    .padding()
    .background(
      RoundedRectangle(cornerRadius: 6)
        .strokeBorder(Color(hex: template.colorHex) ?? .clear)
    )
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
