//
//  TemplatesTopView.swift
//  BobbyClone
//
//  Created by Antoine De Roose on 18/12/2021.
//

import SwiftUI

struct TemplatesTopView: View {
  
  @Binding var viewDisplayed: Int
  
  @Environment(\.dismiss) private var dismissTemplatesView
  
  var body: some View {
    VStack(spacing: 0) {
      HStack {
        Button(action: { dismissTemplatesView() }) {
          Image(systemName: "chevron.down")
            .font(Font.body.weight(.semibold))
        }
        .foregroundColor(.primary)
        Spacer()
        Text("Ajouter un abonnement")
          .fontWeight(.semibold)
        Spacer()
        Button(action: {}) {
          Image(systemName: "magnifyingglass")
            .font(Font.body.weight(.semibold))
        }
        .foregroundColor(.primary)
      }
      .padding()
      HStack(spacing: 100) {
        Text("Tous")
          .fontWeight(.bold)
          .foregroundColor(viewDisplayed == 0 ? .primary : .secondary)
          .textCase(.uppercase)
          .onTapGesture { viewDisplayed = 0 }
        Text("Populaires")
          .fontWeight(.bold)
          .foregroundColor(viewDisplayed == 1 ? .primary : .secondary)
          .textCase(.uppercase)
          .onTapGesture { viewDisplayed = 1 }
      }
      .padding()
      LineSeparator()
    }
    .ignoresSafeArea()
  }
}

struct TemplatesTopView_Previews: PreviewProvider {
  @State static var viewDisplayed = 0
  static var previews: some View {
    TemplatesTopView(viewDisplayed: $viewDisplayed)
  }
}
