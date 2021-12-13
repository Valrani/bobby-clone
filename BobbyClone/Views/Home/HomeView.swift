//
//  HomeView.swift
//  BobbyClone
//
//  Created by Antoine De Roose on 10/12/2021.
//

import SwiftUI

struct HomeView: View {
  
  @EnvironmentObject var subscriptionLibrary: SubscriptionLibrary
  
  var body: some View {
    NavigationView {
      VStack(spacing: 0) {
        HomeTopView()
        ScrollView {
          ForEach(subscriptionLibrary.allSubscriptions) { subscription in
            SubscriptionCellView(subscription: subscription)
              .padding(.bottom, 3)
          }
          .padding(.vertical, 8)
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
