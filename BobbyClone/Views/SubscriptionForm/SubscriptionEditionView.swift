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
  @EnvironmentObject var subscriptionLibrary: SubscriptionLibrary
  @State private var subscriptionConfig = SubscriptionConfig()
  
  var body: some View {
    VStack(spacing: 0) {
      SubscriptionFormTopView(subscriptionConfig: $subscriptionConfig, onSave: updateSubscriptionAndDismiss)
      SubscriptionFormView(subscriptionConfig: $subscriptionConfig, formState: .edition, onDelete: deleteSubscriptionAndDismiss)
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
    subscriptionConfig.billingCycleNumber = subscription.billingCycleNumber
    subscriptionConfig.billingCycleTimeUnit = subscription.billingCycleTimeUnit
  }
  
  private func updateSubscriptionAndDismiss() {
    subscription.iconString = subscriptionConfig.iconString
    subscription.price = subscriptionConfig.price
    subscription.name = subscriptionConfig.name
    subscription.description = subscriptionConfig.description.isEmpty ? nil : subscriptionConfig.description
    subscription.colorHex = subscriptionConfig.colorHex
    subscription.firstBilling = subscriptionConfig.firstBilling
    subscription.billingCycleNumber = subscriptionConfig.billingCycleNumber
    subscription.billingCycleTimeUnit = subscriptionConfig.billingCycleTimeUnit
    dismissSubscriptionEditionView()
  }
  
  private func deleteSubscriptionAndDismiss() {
    if let index = subscriptionLibrary.allSubscriptions.firstIndex(where: { $0.id == subscription.id }) {
      subscriptionLibrary.allSubscriptions.remove(at: index)
    }
    dismissSubscriptionEditionView()
  }
  
}

struct SubscriptionEdition_Previews: PreviewProvider {
  @StateObject static var subscriptionLibrary = SubscriptionLibrary()
  static var previews: some View {
    SubscriptionEditionView(subscription: subscriptionLibrary.allSubscriptions[0])
      .environmentObject(SubscriptionLibrary())
  }
}
