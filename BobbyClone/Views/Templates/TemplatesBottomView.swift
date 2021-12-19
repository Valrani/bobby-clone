//
//  SubscriptionCreationButtonView.swift
//  BobbyClone
//
//  Created by Antoine De Roose on 18/12/2021.
//

import SwiftUI

struct SubscriptionCreationButtonView: View {
  var body: some View {
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
}

struct SubscriptionCreationButtonView_Previews: PreviewProvider {
  static var previews: some View {
    SubscriptionCreationButtonView()
      .previewLayout(.sizeThatFits)
  }
}
