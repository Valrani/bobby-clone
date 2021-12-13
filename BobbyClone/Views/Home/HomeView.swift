//
//  HomeView.swift
//  BobbyClone
//
//  Created by Antoine De Roose on 10/12/2021.
//

import SwiftUI

struct HomeView: View {
  
  @EnvironmentObject var subscriptionLibrary: SubscriptionLibrary
  @State private var isShowingSubscriptionEditionSheet: Subscription? = nil
  
  var body: some View {
    NavigationView {
      VStack(spacing: 0) {
        HomeTopView()
        ScrollView {
          ForEach(subscriptionLibrary.allSubscriptions) { subscription in
            SubscriptionCellView(subscription: subscription)
              .padding(.horizontal)
              .padding(.vertical, 2)
              .onTapGesture {
                isShowingSubscriptionEditionSheet = subscription
              }
          }
          .sheet(item: $isShowingSubscriptionEditionSheet) { subscription in
            SubscriptionEditionView(subscription: subscription)
          }
          .padding(.vertical, 12)
        }
        HomeBottomView()
      }
      .navigationBarHidden(true)
    }
  }
}

struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    HomeView()
      .environmentObject(SubscriptionLibrary())
  }
}
