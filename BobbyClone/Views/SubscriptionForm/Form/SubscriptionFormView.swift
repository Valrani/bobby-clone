//
//  SubscriptionFormView.swift
//  BobbyClone
//
//  Created by Antoine De Roose on 14/12/2021.
//
//  https://stackoverflow.com/questions/61178868/swiftui-random-extra-argument-in-call-error/61180001

import SwiftUI

struct SubscriptionFormView: View {
  
  @Binding var subscriptionConfig: SubscriptionConfig
  @State var formState: FormState
  let onDelete: () -> Void
  
  @State private var isShowingIconSelectionSheet = false
  @State private var isShowingColorSelectionSheet = false
  @State private var isShowingBillingCyclePicker = false
  @State private var isShowingDeleteConfirmationDialog = false
  
  var body: some View {
    ZStack(alignment: .bottom) {
      Rectangle()
        .foregroundColor(subscriptionConfig.colorHex == nil ? Color(uiColor: .systemBackground) : Color(hex: subscriptionConfig.colorHex!))
        .ignoresSafeArea()
      VStack(spacing: 0) {
        ScrollView {
          VStack {
            Group {
              Button(action: showIconSelectionSheet) {
                Image(systemName: subscriptionConfig.iconString)
                  .font(.largeTitle)
                  .padding(32)
              }
              .sheet(isPresented: $isShowingIconSelectionSheet) {
                IconSelectionView(selectedIconString: $subscriptionConfig.iconString)
                  .foregroundColor(.primary)
              }
              DecimalField(double: $subscriptionConfig.price)
                .multilineTextAlignment(.center)
                .font(.title2)
                .padding(.bottom, 32)
              HStack {
                Text("Nom")
                TextField("Entrer un nom", text: $subscriptionConfig.name)
                  .multilineTextAlignment(.trailing)
              }
              LineSeparator(color: subscriptionConfig.colorHex == nil ? Color.primary : Color.white)
                .padding(.bottom, 4)
              HStack {
                Text("Description")
                TextField("Entrer une description", text: $subscriptionConfig.description)
                  .multilineTextAlignment(.trailing)
              }
              LineSeparator(color: subscriptionConfig.colorHex == nil ? Color.primary : Color.white)
                .padding(.bottom, 4)
              OptionalDatePicker(selection: $subscriptionConfig.firstBilling, range: ...Date(), displayedComponents: .date, prompt: "Entrer une date") {
                Text("Première facturation")
              }
              LineSeparator(color: subscriptionConfig.colorHex == nil ? Color.primary : Color.white)
                .padding(.bottom, 4)
            }
            Group {
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
              LineSeparator(color: subscriptionConfig.colorHex == nil ? Color.primary : Color.white)
                .padding(.bottom, 4)
              Button(action: toggleBillingCyclePicker) {
                HStack {
                  Text("Cycle")
                  Spacer()
                  Text("Chaque \(subscriptionConfig.billingCycleNumber) \(displayTimeUnitText(timeUnit: subscriptionConfig.billingCycleTimeUnit))")
                    .font(.callout)
                    .foregroundColor(Color(uiColor: .tertiaryLabel))
                }
              }
            }
          }
          .foregroundColor(subscriptionConfig.colorHex == nil ? .primary : .white)
          .padding(.horizontal)
          .padding(.bottom)
          if formState == .edition {
            Button(action: showDeleteConfirmationDialog) {
              Text("Supprimer Abonnement")
                .textCase(.uppercase)
                .opacity(0.6)
                .foregroundColor(subscriptionConfig.colorHex == nil ? .primary : .white)
            }
            .padding(32)
            .confirmationDialog("Delete subscription confirmation dialog", isPresented: $isShowingDeleteConfirmationDialog) {
              Button("Supprimer \(subscriptionConfig.name)", role: .destructive, action: onDelete)
              Button("Annuler", role: .cancel) {}
            } message: {
              Text("Cette action est irréversible.")
            }
          }
        }
      }
      .zIndex(1)
      if isShowingBillingCyclePicker {
        VStack(alignment: .trailing) {
          Button(action: toggleBillingCyclePicker) {
            Text("Terminé")
              .padding()
              .font(.body)
              .foregroundColor(.secondary)
          }
          BillingCyclePicker(number: $subscriptionConfig.billingCycleNumber, timeUnit: $subscriptionConfig.billingCycleTimeUnit)
        }
        .frame(maxWidth: .infinity)
        .background(Color(uiColor: .systemBackground))
        .transition(.move(edge: .bottom))
        .zIndex(2)
      }
    }
  }
  
  private func showIconSelectionSheet() {
    isShowingIconSelectionSheet = true
  }
  
  private func showColorSelectionSheet() {
    isShowingColorSelectionSheet = true
  }
  
  private func toggleBillingCyclePicker() {
    withAnimation {
      isShowingBillingCyclePicker.toggle()
    }
  }
  
  private func displayTimeUnitText(timeUnit: TimeUnit) -> String {
    switch timeUnit {
    case .day:
      return "Jour"
    case .week:
      return "Semaine"
    case .month:
      return "Mois"
    case .year:
      return "Année"
    }
  }
  
  private func showDeleteConfirmationDialog() {
    isShowingDeleteConfirmationDialog = true
  }
  
}

struct SubscriptionDetailView_Previews: PreviewProvider {
  @State static var subscriptionConfig = SubscriptionConfig()
  static var previews: some View {
    SubscriptionFormView(subscriptionConfig: $subscriptionConfig, formState: .edition, onDelete: {
      print("deleting...")
    })
  }
}
