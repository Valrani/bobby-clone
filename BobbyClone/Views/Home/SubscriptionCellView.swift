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
            .padding(.vertical, 12)
            .background {
                RoundedRectangle(cornerRadius: 5)
                    .foregroundColor(Color(subscription.colorHexa))
                    .border(Color(subscription.colorHexa))
            }
            .padding(.horizontal)
    }
}

struct SubscriptionCellView_Previews: PreviewProvider {
    @StateObject static var subscription_2020_01_01 = Subscription(name: "PlayStation Plus", price: 50, iconString: "plus", colorHexa: "#00A1FF", firstBilling: Date(timeIntervalSince1970: 1577860560), billingCycleNumber: 1, billingCycleTimeUnit: .year)
    @StateObject static var subscription_2021_12_08 =  Subscription(name: "Notion", price: 4, iconString: "questionmark.square", colorHexa: "#B0B0B0", firstBilling: Date(timeIntervalSince1970: 1638939600), billingCycleNumber: 1, billingCycleTimeUnit: .month)
    @StateObject static var subscription_noFirstBilling =  Subscription(name: "Netflix", price: 9.99, iconString: "n.circle", colorHexa: "#FF3535", billingCycleNumber: 1, billingCycleTimeUnit: .month)
    static var previews: some View {
        Group {
            SubscriptionCellView(subscription: subscription_2020_01_01)
            SubscriptionCellView(subscription: subscription_2021_12_08)
            SubscriptionCellView(subscription: subscription_noFirstBilling)
        }
        .previewLayout(.sizeThatFits)
    }
}
