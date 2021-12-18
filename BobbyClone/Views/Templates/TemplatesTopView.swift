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
        Spacer()
        Text("Ajouter un abonnement")
          .fontWeight(.semibold)
          .lineLimit(1)
        Spacer()
        Button(action: { dismissTemplatesView() }) {
          Image(systemName: "magnifyingglass")
            .font(Font.body.weight(.semibold))
        }
      }
      .padding()
      HStack {
        Text("Go All")
          .onTapGesture { onChangeViewDisplayed(0) }
        Spacer()
        Text("Go Popular")
          .onTapGesture { onChangeViewDisplayed(1) }
        Spacer()
        Text("Go Nibba")
          .onTapGesture { onChangeViewDisplayed(2) }
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
