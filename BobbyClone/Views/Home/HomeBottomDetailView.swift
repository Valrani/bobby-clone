//
//  HomeBottomDetailView.swift
//  BobbyClone
//
//  Created by Antoine De Roose on 12/12/2021.
//

import SwiftUI

struct HomeBottomDetailView: View {
    
    let numberOfSubscriptions: Int
    let averageExpenses: Double
    
    var body: some View {
        VStack(spacing: 0) {
            LineSeparator()
            HStack {
                Text("\(numberOfSubscriptions) abonnements")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Spacer()
                Text("\(averageExpenses, specifier: "%.2f") €")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            .padding()
        }
    }
}

struct HomeBottomDetailView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HomeBottomDetailView(numberOfSubscriptions: 0, averageExpenses: 99.99)
            HomeBottomDetailView(numberOfSubscriptions: 1, averageExpenses: 19.00)
            HomeBottomDetailView(numberOfSubscriptions: 8, averageExpenses: 50)
        }
        .previewLayout(.sizeThatFits)
    }
}
