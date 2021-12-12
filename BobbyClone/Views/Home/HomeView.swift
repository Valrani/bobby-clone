//
//  HomeView.swift
//  BobbyClone
//
//  Created by Antoine De Roose on 10/12/2021.
//

import SwiftUI

struct HomeView: View {
  
  @ObservedObject var subscriptionLibrary: SubscriptionLibrary
  
  var body: some View {
    NavigationView {
      VStack {
        HomeTopView()
        ScrollView {
          ForEach(subscriptionLibrary.allSubscriptions) { subscription in
            SubscriptionCellView(subscription: subscription)
              .padding(.bottom, 3)
          }
        }
        HomeBottomView(subscriptionLibrary: subscriptionLibrary)
      }
      .navigationBarHidden(true)
    }
  }
  
}

struct HomeView_Previews: PreviewProvider {
  @StateObject static var subscriptionLibrary = SubscriptionLibrary()
  static var previews: some View {
    HomeView(subscriptionLibrary: subscriptionLibrary)
  }
}
