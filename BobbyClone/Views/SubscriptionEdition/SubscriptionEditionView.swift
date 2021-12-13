//
//  SubscriptionEditionView.swift
//  BobbyClone
//
//  Created by Antoine De Roose on 13/12/2021.
//

import SwiftUI

struct SubscriptionEditionView: View {
  
  @ObservedObject var subscription: Subscription
  
  var body: some View {
    ZStack {
      Rectangle()
        .foregroundColor(Color(hex: subscription.colorHex))
        .ignoresSafeArea()
      VStack(spacing: 0) {
        SubscriptionEditionTopView(name: subscription.name, onSave: saveSubscription)
        ScrollView {
          Text("En travaux...")
        }
      }
      .foregroundColor(.white)
    }
  }
  
  private func saveSubscription() {
    print("Saving \(subscription.name)...")
  }
  
}

struct SubscriptionEdition_Previews: PreviewProvider {
  @StateObject static var subscriptionLibrary = SubscriptionLibrary()
  static var previews: some View {
    SubscriptionEditionView(subscription: subscriptionLibrary.allSubscriptions[0])
  }
}
