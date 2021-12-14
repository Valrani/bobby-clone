//
//  SubscriptionFormView.swift
//  BobbyClone
//
//  Created by Antoine De Roose on 14/12/2021.
//

import SwiftUI

struct SubscriptionFormView: View {
  
  @Binding var subscriptionForm: SubscriptionForm
  
  var body: some View {
    VStack {
      Button(action: {}) {
        Image(systemName: subscriptionForm.iconString)
          .font(.largeTitle)
          .padding()
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
      DatePicker("Première facturation", selection: $subscriptionForm.firstBilling, in: ...Date(), displayedComponents: .date)
        .preferredColorScheme(.dark)
    }
    .padding(.horizontal)
  }
}

struct SubscriptionDetailView_Previews: PreviewProvider {
  @State static var subscriptionForm = SubscriptionForm()
  static var previews: some View {
    SubscriptionFormView(subscriptionForm: $subscriptionForm)
  }
}
