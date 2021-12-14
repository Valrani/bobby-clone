//
//  LineSeparator.swift
//  BobbyClone
//
//  Created by Antoine De Roose on 12/12/2021.
//

import SwiftUI

struct LineSeparator: View {
  
  var color: Color = .gray
  
  var body: some View {
    Rectangle()
      .frame(height: 1)
      .foregroundColor(color)
      .opacity(0.3)
  }
}

struct LineSeparator_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      LineSeparator()
      LineSeparator(color: .red)
      LineSeparator(color: .green)
    }
    .previewLayout(.sizeThatFits)
    .padding()
  }
}
