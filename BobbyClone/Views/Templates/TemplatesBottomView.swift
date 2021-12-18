//
//  TemplatesBottomView.swift
//  BobbyClone
//
//  Created by Antoine De Roose on 18/12/2021.
//

import SwiftUI

struct TemplatesBottomView: View {
  
  var body: some View {
    VStack(spacing: 0) {
      LineSeparator()
        .padding(.bottom)
      Button(action: {}) {
        HStack {
          Spacer()
          Text("Créer un abonnement personnalisé")
            .foregroundColor(.white)
            .fontWeight(.bold)
          Spacer()
        }
        .padding()
        .background(.gray)
        .cornerRadius(6)
      }
      .padding([.horizontal, .bottom])
    }
    .background(CustomColors.accentBackground)
  }
}

struct TemplatesBottomView_Previews: PreviewProvider {
  static var previews: some View {
    TemplatesBottomView()
  }
}
