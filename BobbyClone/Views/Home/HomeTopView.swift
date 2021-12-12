//
//  HomeTopView.swift
//  BobbyClone
//
//  Created by Antoine De Roose on 12/12/2021.
//

import SwiftUI

struct HomeTopView: View {
  
  @State private var isShowingSettingsSheet = false
  @State private var isShowingCategoriesSheet = false
  @State private var isShowingSubscriptionTemplatesSheet = false
  
  var body: some View {
    VStack(spacing: 0) {
      HStack {
        Button(action: showSettingsSheet) {
          Image(systemName: "gearshape")
            .font(Font.title3.weight(.bold))
            .foregroundColor(.secondary)
        }
        .sheet(isPresented: $isShowingSettingsSheet) {
          SettingsView()
        }
        Spacer()
        Button(action: showCategoriesSheet) {
          HStack {
            Text("Toutes les souscriptions")
              .fontWeight(.bold)
            Image(systemName: "chevron.down")
              .font(Font.caption.weight(.bold))
          }
          .foregroundColor(.primary)
        }
        .sheet(isPresented: $isShowingCategoriesSheet) {
          CategoriesView()
        }
        Spacer()
        Button(action: showSubscriptionTemplatesSheet) {
          Image(systemName: "plus")
            .font(Font.title3.weight(.bold))
            .foregroundColor(.secondary)
        }
        .sheet(isPresented: $isShowingSubscriptionTemplatesSheet) {
          SubscriptionTemplatesView()
        }
      }
      .padding()
      LineSeparator()
    }
  }
  
  private func showSettingsSheet() {
    isShowingSettingsSheet = true
  }
  
  private func showCategoriesSheet() {
    isShowingCategoriesSheet = true
  }
  
  private func showSubscriptionTemplatesSheet() {
    isShowingSubscriptionTemplatesSheet = true
  }
  
}

struct HomeTopView_Previews: PreviewProvider {
  static var previews: some View {
    HomeTopView()
      .previewLayout(.sizeThatFits)
  }
}
