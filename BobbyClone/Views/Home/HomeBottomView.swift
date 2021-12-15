//
//  HomeBottomView.swift
//  BobbyClone
//
//  Created by Antoine De Roose on 12/12/2021.
//

import SwiftUI

struct HomeBottomView: View {
  
  @EnvironmentObject var subscriptionLibrary: SubscriptionLibrary
  @State private var displayMode: TimeUnit = .year
  @State private var isShowingDetailView = false
  
  var body: some View {
    VStack(spacing: 0) {
      if isShowingDetailView {
        HomeBottomDetailView(numberOfSubscriptions: subscriptionLibrary.allSubscriptions.count, averageExpenses: calculateAverageExpenses())
          .transition(.move(edge: .bottom))
      }
      LineSeparator()
      HStack {
        Button(action: changeDisplayMode) {
          VStack(alignment: .leading) {
            Text("Dépenses Moyennes")
              .foregroundColor(.primary)
              .font(.headline)
            Text(displayTimeUnitText())
              .font(.caption)
              .fontWeight(.semibold)
              .foregroundColor(.secondary)
          }
          .padding()
        }
        Spacer()
        Button(action: toggleDetailView) {
          Text("\(calculateAverageExpenses(), specifier: "%.2f") €")
            .font(.headline)
            .foregroundColor(CustomColors.accentSecondary)
            .padding()
        }
      }
      .background(CustomColors.accentBackground)
    }
  }
  
  private func changeDisplayMode() {
    if displayMode == .week { displayMode = .month }
    else if displayMode == .month { displayMode = .year }
    else if displayMode == .year { displayMode = .week }
  }
  
  private func toggleDetailView() {
    withAnimation {
      isShowingDetailView.toggle()
    }
  }
  
  private func displayTimeUnitText() -> String {
    if displayMode == .week { return "PAR SEMAINE" }
    if displayMode == .month { return "PAR MOIS" }
    return "PAR ANNÉE"
  }
  
  private func calculateAverageExpenses() -> Double {
    guard !subscriptionLibrary.allSubscriptions.isEmpty else { return 0 }
    var averageExpensesPerWeek = 0.00
    for subscription in subscriptionLibrary.allSubscriptions {
      averageExpensesPerWeek += subscription.pricePerWeek
    }
    if displayMode == .week { return averageExpensesPerWeek }
    if displayMode == .month { return averageExpensesPerWeek * Constants.weeksInAMonth }
    return averageExpensesPerWeek * Constants.weeksInAYear
  }
  
}

struct HomeBottomView_Previews: PreviewProvider {
  static var previews: some View {
    HomeBottomView()
      .environmentObject(SubscriptionLibrary())
      .previewLayout(.sizeThatFits)
  }
}
