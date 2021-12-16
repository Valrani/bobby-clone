//
//  SubscriptionEditionView.swift
//  BobbyClone
//
//  Created by Antoine De Roose on 13/12/2021.
//

import SwiftUI

struct SubscriptionEditionView: View {
  
  @ObservedObject var subscription: Subscription
  
  @Environment(\.dismiss) private var dismissSubscriptionEditionView
  @State private var subscriptionConfig = SubscriptionConfig()
  
  var body: some View {
    VStack(spacing: 0) {
      SubscriptionFormTopView(subscriptionConfig: $subscriptionConfig, onSave: updateSubscriptionAndDismiss)
      SubscriptionFormView(subscriptionConfig: $subscriptionConfig)
    }
    .onAppear {
      initSubscriptionForm()
    }
  }
  
  private func initSubscriptionForm() {
    subscriptionConfig.iconString = subscription.iconString
    subscriptionConfig.price = subscription.price
    subscriptionConfig.name = subscription.name
    subscriptionConfig.description = subscription.description ?? ""
    subscriptionConfig.colorHex = subscription.colorHex
    subscriptionConfig.firstBilling = subscription.firstBilling
  }
  
  private func updateSubscriptionAndDismiss() {
    subscription.iconString = subscriptionConfig.iconString
    subscription.price = subscriptionConfig.price
    subscription.name = subscriptionConfig.name
    subscription.description = subscriptionConfig.description.isEmpty ? nil : subscriptionConfig.description
    subscription.colorHex = subscriptionConfig.colorHex
    subscription.firstBilling = subscriptionConfig.firstBilling
    dismissSubscriptionEditionView()
  }
  
  private func deleteSubscription() {
    //TODO: delete
  }
  
}

struct SubscriptionEdition_Previews: PreviewProvider {
  @StateObject static var subscriptionLibrary = SubscriptionLibrary()
  static var previews: some View {
    SubscriptionEditionView(subscription: subscriptionLibrary.allSubscriptions[0])
  }
}
