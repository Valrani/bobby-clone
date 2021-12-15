//
//  SubscriptionEditionView.swift
//  BobbyClone
//
//  Created by Antoine De Roose on 13/12/2021.
//

import SwiftUI

struct SubscriptionEditionView: View {
  
  @Environment(\.dismiss) private var dismissSubscriptionEditionView
  @ObservedObject var subscription: Subscription
  @State private var subscriptionForm = SubscriptionConfig()
  
  var body: some View {
    ZStack {
      Rectangle()
        .foregroundColor(Color(hex: subscription.colorHex))
        .ignoresSafeArea()
      VStack(spacing: 0) {
        SubscriptionFormTopView(name: subscription.name, onSave: updateSubscriptionAndDismiss)
        ScrollView {
          SubscriptionFormView(subscriptionForm: $subscriptionForm)
        }
      }
      .foregroundColor(.white)
    }
    .onAppear {
      fillSubscriptionForm()
    }
  }
  
  private func fillSubscriptionForm() {
    subscriptionForm.iconString = subscription.iconString
    subscriptionForm.price = subscription.price
    subscriptionForm.name = subscription.name
    subscriptionForm.description = subscription.description ?? ""
    subscriptionForm.firstBilling = subscription.firstBilling ?? Date()
  }
  
  private func updateSubscriptionAndDismiss() {
    subscription.iconString = subscriptionForm.iconString
    subscription.price = subscriptionForm.price
    subscription.name = subscriptionForm.name
    subscription.description = subscriptionForm.description.isEmpty ? nil : subscriptionForm.description
    subscription.firstBilling = subscriptionForm.firstBilling
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
