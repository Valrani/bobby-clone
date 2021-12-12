//
//  BobbyCloneApp.swift
//  BobbyClone
//
//  Created by Antoine De Roose on 10/12/2021.
//

import SwiftUI

@main
struct BobbyCloneApp: App {
  
  @StateObject var subscriptionLibrary = SubscriptionLibrary()
  
  var body: some Scene {
    WindowGroup {
      HomeView(subscriptionLibrary: subscriptionLibrary)
    }
  }
}
