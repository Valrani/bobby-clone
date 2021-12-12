//
//  LineSeparator.swift
//  BobbyClone
//
//  Created by Antoine De Roose on 12/12/2021.
//

import SwiftUI

struct LineSeparator: View {
  var body: some View {
    Rectangle()
      .frame(height: 1)
      .foregroundColor(.gray)
      .opacity(0.3)
  }
}

struct LineSeparator_Previews: PreviewProvider {
  static var previews: some View {
    LineSeparator()
      .previewLayout(.sizeThatFits)
  }
}
