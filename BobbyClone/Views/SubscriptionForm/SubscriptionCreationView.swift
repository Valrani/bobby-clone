//
//  SubscriptionCreationView.swift
//  BobbyClone
//
//  Created by Antoine De Roose on 13/12/2021.
//

import SwiftUI

struct SubscriptionCreationView: View {
  
  @Environment(\.dismiss) private var dismissSubscriptionCreationView
  @EnvironmentObject var subscriptionLibrary: SubscriptionLibrary
  @State private var subscriptionConfig = SubscriptionConfig()
  
  var body: some View {
    VStack(spacing: 0) {
      SubscriptionFormTopView(subscriptionConfig: $subscriptionConfig, onSave: createSubscriptionAndDismiss)
      SubscriptionFormView(subscriptionConfig: $subscriptionConfig, formState: .creation, onDelete: {})
    }
  }
  
  private func createSubscriptionAndDismiss() {
    let subscription = Subscription(
      name: subscriptionConfig.name,
      description: subscriptionConfig.description.isEmpty ? nil : subscriptionConfig.description,
      price: subscriptionConfig.price,
      iconString: subscriptionConfig.iconString,
      colorHex: subscriptionConfig.colorHex,
      firstBilling: subscriptionConfig.firstBilling,
      billingCycleNumber: subscriptionConfig.billingCycleNumber,
      billingCycleTimeUnit: subscriptionConfig.billingCycleTimeUnit
    )
    subscriptionLibrary.allSubscriptions.append(subscription)
    dismissSubscriptionCreationView()
  }
  
}

struct SubscriptionCreationView_Previews: PreviewProvider {
  static var previews: some View {
    SubscriptionCreationView()
      .environmentObject(SubscriptionLibrary())
  }
}
