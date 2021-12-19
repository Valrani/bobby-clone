//
//  SubscriptionCreationView.swift
//  BobbyClone
//
//  Created by Antoine De Roose on 13/12/2021.
//

import SwiftUI

struct SubscriptionCreationView: View {
  
  var template: Template?
  
  @EnvironmentObject var subscriptionLibrary: SubscriptionLibrary
  @State private var subscriptionConfig = SubscriptionConfig()
  
  var body: some View {
    VStack(spacing: 0) {
      SubscriptionFormTopView(subscriptionConfig: $subscriptionConfig, onSave: createSubscriptionAndDismiss)
      SubscriptionFormView(subscriptionConfig: $subscriptionConfig, formState: .creation, onDelete: {})
    }
    .onAppear {
      if let template = template {
        initSubscriptionForm(template: template)
      }
    }
    .navigationBarHidden(true)
  }
  
  private func initSubscriptionForm(template: Template) {
    subscriptionConfig.iconString = template.iconString
    subscriptionConfig.name = template.name
    subscriptionConfig.colorHex = template.colorHex
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
    UIApplication.shared.windows.first?.rootViewController?.dismiss(animated: true)
  }
  
}

struct SubscriptionCreationView_Previews: PreviewProvider {
  @State static var template: Template? = nil
  static var previews: some View {
    SubscriptionCreationView(template: template)
      .environmentObject(SubscriptionLibrary())
  }
}
