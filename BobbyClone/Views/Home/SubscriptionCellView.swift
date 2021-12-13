//
//  SubscriptionCellView.swift
//  BobbyClone
//
//  Created by Antoine De Roose on 11/12/2021.
//

import SwiftUI

struct SubscriptionCellView: View {
  
  @ObservedObject var subscription: Subscription
  
  var body: some View {
    HStack {
      Image(systemName: subscription.iconString)
        .font(.title)
        .padding(.trailing, 8)
      Text(subscription.name)
        .font(.headline)
        .fontWeight(.none)
      Spacer()
      VStack(alignment: .trailing) {
        Text("\(subscription.price, specifier: "%.2f") €")
          .font(.headline)
          .fontWeight(.none)
        if let nextBilling = subscription.nextBillingString {
          Text(nextBilling)
            .font(.callout)
        }
      }
    }
    .foregroundColor(.white)
    .padding(.horizontal)
    .frame(minHeight: 60)
    .background {
      RoundedRectangle(cornerRadius: 5)
        .foregroundColor(Color(hex: subscription.colorHex))
    }
  }
}

struct SubscriptionCellView_Previews: PreviewProvider {
  @StateObject static var subscriptionLibrary = SubscriptionLibrary()
  static var previews: some View {
    Group {
      ForEach(subscriptionLibrary.allSubscriptions.prefix(3)) { subscription in
        SubscriptionCellView(subscription: subscription)
      }
    }
    .previewLayout(.sizeThatFits)
  }
}
