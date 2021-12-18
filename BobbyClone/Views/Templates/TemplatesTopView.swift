//
//  TemplatesTopView.swift
//  BobbyClone
//
//  Created by Antoine De Roose on 18/12/2021.
//

import SwiftUI

struct TemplatesTopView: View {
  
  let onChangeViewDisplayed: (_ newValue: Int) -> Void
  
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
          .lineLimit(1)
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
          .textCase(.uppercase)
          .onTapGesture { onChangeViewDisplayed(0) }
        Text("Populaires")
          .textCase(.uppercase)
          .onTapGesture { onChangeViewDisplayed(1) }
      }
      .padding()
      LineSeparator()
    }
    .ignoresSafeArea()
  }
}

//struct TemplatesTopView_Previews: PreviewProvider {
//  static var previews: some View {
//    TemplatesTopView()
//  }
//}
