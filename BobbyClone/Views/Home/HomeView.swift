//
//  HomeView.swift
//  BobbyClone
//
//  Created by Antoine De Roose on 10/12/2021.
//

import SwiftUI

struct HomeView: View {
    
    @State private var subscription: Subscription = fakeSubscriptions[0]
    
    var body: some View {
        VStack {
            Text("Tous les \(subscription.billingCycleNumber) \(subscription.billingCycleTimeUnit.rawValue)")
            Text(subscription.firstBilling!, style: .date)
            Text(subscription.nextBilling!, style: .date)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
