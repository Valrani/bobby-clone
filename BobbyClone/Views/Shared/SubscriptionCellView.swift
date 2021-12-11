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
                    .font(.largeTitle)
                Text(subscription.name)
                Spacer()
                VStack(alignment: .trailing) {
                    Text("\(subscription.price, specifier: "%.2f") €")
                    Text("placeholder")
                }
            }
            .padding()
            .background {
                RoundedRectangle(cornerRadius: 5)
                    .foregroundColor(.cyan)
            }
    }
}

struct SubscriptionCellView_Previews: PreviewProvider {
    @StateObject static var subscription_2020_01_01 = Subscription(name: "PS+", price: 50, iconString: "plus", colorHexa: "#00A1FF", firstBilling: Date(timeIntervalSince1970: 1577860560), billingCycleNumber: 1, billingCycleTimeUnit: .year)
    @StateObject static var subscription_2021_12_08 =  Subscription(name: "Notion", price: 4, iconString: "questionmark.square", colorHexa: "#B0B0B0", firstBilling: Date(timeIntervalSince1970: 1638939600), billingCycleNumber: 1, billingCycleTimeUnit: .month)
    static var previews: some View {
        Group {
            SubscriptionCellView(subscription: subscription_2020_01_01)
                
            SubscriptionCellView(subscription: subscription_2021_12_08)
        }
        .previewLayout(.sizeThatFits)
        .padding()
    }
}
