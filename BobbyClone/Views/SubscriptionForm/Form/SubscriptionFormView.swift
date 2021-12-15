//
//  SubscriptionFormView.swift
//  BobbyClone
//
//  Created by Antoine De Roose on 14/12/2021.
//

import SwiftUI

struct SubscriptionFormView: View {
  
  @State private var isShowingIconSheet = false
  @Binding var subscriptionForm: SubscriptionConfig
  
  var body: some View {
    VStack {
      Button(action: showIconSheet) {
        Image(systemName: subscriptionForm.iconString)
          .font(.largeTitle)
          .padding()
      }
      .sheet(isPresented: $isShowingIconSheet) {
        IconView(selectedIconString: $subscriptionForm.iconString)
      }
      Text("\(subscriptionForm.price, specifier: "%.2f") €")
        .padding(.bottom)
      HStack {
        Text("Nom")
        TextField("Entrer un nom", text: $subscriptionForm.name)
          .multilineTextAlignment(.trailing)
      }
      LineSeparator(color: .white)
      HStack {
        Text("Description")
        TextField("Entrer une description", text: $subscriptionForm.description)
          .multilineTextAlignment(.trailing)
      }
      LineSeparator(color: .white)
      DatePicker(selection: $subscriptionForm.firstBilling, in: ...Date(), displayedComponents: .date) {
        Text("Première facturation")
      }
      .preferredColorScheme(.dark)
    }
    .padding(.horizontal)
  }
  
  private func showIconSheet() {
    isShowingIconSheet = true
  }
  
}

struct SubscriptionDetailView_Previews: PreviewProvider {
  @State static var subscriptionForm = SubscriptionConfig()
  static var previews: some View {
    SubscriptionFormView(subscriptionForm: $subscriptionForm)
  }
}
