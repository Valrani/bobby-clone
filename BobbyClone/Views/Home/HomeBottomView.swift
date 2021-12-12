//
//  HomeBottomView.swift
//  BobbyClone
//
//  Created by Antoine De Roose on 12/12/2021.
//

import SwiftUI

struct HomeBottomView: View {
    
    @ObservedObject var subscriptionLibrary: SubscriptionLibrary
    @State private var displayMode: TimeUnit = .year
    @State private var isShowingDetailView = false
    
    var body: some View {
        VStack(spacing: 0) {
            if isShowingDetailView {
                HomeBottomDetailView(numberOfSubscriptions: subscriptionLibrary.allSubscriptions.count, averageExpenses: 0)
            }
            LineSeparator()
            HStack {
                Button(action: changeDisplayMode) {
                    VStack(alignment: .leading) {
                        Text("Dépenses moyennes")
                            .foregroundColor(.primary)
                            .font(.headline)
                        Text(displayTimeUnitText())
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    .padding()
                }
                Spacer()
                
                Button(action: toggleDetailView) {
                    Text("\(displayAverageExpenses(), specifier: "%.2f") €")
                        .font(.headline)
                        .foregroundColor(.secondary)
                        .padding(20)
                }
            }
        }
    }
    
    private func changeDisplayMode() {
        if displayMode == .week { displayMode = .month }
        else if displayMode == .month { displayMode = .year }
        else if displayMode == .year { displayMode = .week }
    }
    
    private func toggleDetailView() {
        isShowingDetailView.toggle()
    }
    
    private func displayTimeUnitText() -> String {
        if displayMode == .week { return "PAR SEMAINE" }
        if displayMode == .month { return "PAR MOIS" }
        return "PAR ANNÉE"
    }
    
    private func displayAverageExpenses() -> Double {
        guard !subscriptionLibrary.allSubscriptions.isEmpty else { return 0 }
        var averageExpensesPerWeek = 0.00
        for subscription in subscriptionLibrary.allSubscriptions {
            averageExpensesPerWeek += subscription.pricePerWeek
        }
        if displayMode == .week { return averageExpensesPerWeek }
        if displayMode == .month { return averageExpensesPerWeek * K.weeksInAMonth }
        return averageExpensesPerWeek * K.weeksInAYear
    }
    
}

struct HomeBottomView_Previews: PreviewProvider {
    @StateObject static var subscriptionLibrary = SubscriptionLibrary()
    static var previews: some View {
        HomeBottomView(subscriptionLibrary: subscriptionLibrary)
            .previewLayout(.sizeThatFits)
    }
}
