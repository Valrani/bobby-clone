//
//  HomeBottomView.swift
//  BobbyClone
//
//  Created by Antoine De Roose on 12/12/2021.
//

import SwiftUI

struct HomeBottomView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Dépenses moyennes")
                    .font(.headline)
                Text("PAR ANNÉE")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            Spacer()
            Text("1876,47 €")
                .font(.headline)
                .foregroundColor(.secondary)
        }
        .padding()
        .background(.background)
    }
}

struct HomeBottomView_Previews: PreviewProvider {
    static var previews: some View {
        HomeBottomView()
            .previewLayout(.sizeThatFits)
    }
}
