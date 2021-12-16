//
//  SubscriptionFormView.swift
//  BobbyClone
//
//  Created by Antoine De Roose on 14/12/2021.
//

import SwiftUI

struct SubscriptionFormView: View {
  
  @Binding var subscriptionConfig: SubscriptionConfig
  
  @State private var isShowingIconSelectionSheet = false
  @State private var isShowingColorSelectionSheet = false
  
  var body: some View {
    ZStack {
      Rectangle()
        .foregroundColor(Color(hex: subscriptionConfig.colorHex))
        .ignoresSafeArea()
      ScrollView {
        VStack {
          Button(action: showIconSelectionSheet) {
            Image(systemName: subscriptionConfig.iconString)
              .font(.largeTitle)
              .padding(32)
          }
          .sheet(isPresented: $isShowingIconSelectionSheet) {
            IconSelectionView(selectedIconString: $subscriptionConfig.iconString)
              .foregroundColor(.primary)
          }
          Text("\(subscriptionConfig.price, specifier: "%.2f") €")
            .font(.title2)
            .padding(.bottom,32)
          HStack {
            Text("Nom")
            TextField("Entrer un nom", text: $subscriptionConfig.name)
              .multilineTextAlignment(.trailing)
          }
          LineSeparator(color: .white)
            .padding(.bottom, 4)
          HStack {
            Text("Description")
            TextField("Entrer une description", text: $subscriptionConfig.description)
              .multilineTextAlignment(.trailing)
          }
          LineSeparator(color: .white)
            .padding(.bottom, 4)
          OptionalDatePicker(selection: $subscriptionConfig.firstBilling, range: ...Date(), displayedComponents: .date, prompt: "Entrer une date") {
            Text("Première facturation")
          }
          LineSeparator(color: .white)
            .padding(.bottom, 4)
          Button(action: showColorSelectionSheet) {
            HStack {
              Text("Couleur")
              Spacer()
              Image(systemName: "chevron.right")
                .font(.callout)
            }
          }
          .sheet(isPresented: $isShowingColorSelectionSheet) {
            ColorSelectionView(selectedColorHex: $subscriptionConfig.colorHex)
              .foregroundColor(.primary)
          }
        }
        .foregroundColor(subscriptionConfig.colorHex == "#FFFFFF" ? .black : .white)
        .padding(.horizontal)
      }
    }
  }
  
  private func showIconSelectionSheet() {
    isShowingIconSelectionSheet = true
  }
  
  private func showColorSelectionSheet() {
    isShowingColorSelectionSheet = true
  }
  
}

struct SubscriptionDetailView_Previews: PreviewProvider {
  @State static var subscriptionConfig = SubscriptionConfig()
  static var previews: some View {
    SubscriptionFormView(subscriptionConfig: $subscriptionConfig)
  }
}
