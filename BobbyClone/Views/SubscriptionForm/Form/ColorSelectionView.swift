//
//  ColorSelectionView.swift
//  BobbyClone
//
//  Created by Antoine De Roose on 16/12/2021.
//

import SwiftUI

struct ColorSelectionView: View {
  
  @Binding var selectedColorHex: String?
  
  @Environment(\.dismiss) private var dismissColorSelectionView
  
  private let gridLayout = [
    GridItem(.adaptive(minimum: 50), spacing: 40, alignment: .center)
  ]
  
  var body: some View {
    NavigationView {
      ScrollView {
        LazyVGrid(columns: gridLayout) {
          ForEach(colors, id: \.self) { color in
            Button(action: { selectColorAndDismiss(colorHex: color) }) {
              Circle()
                .frame(width: 50, height: 50)
                .foregroundColor(Color(hex: color))
                .padding()
            }
          }
          Button(action: { selectColorAndDismiss(colorHex: nil) }) {
            Circle()
              .frame(width: 50, height: 50)
              .foregroundColor(Color(uiColor: .systemBackground))
              .padding()
              .overlay(
                Circle()
                  .strokeBorder(.primary, lineWidth: 2)
                  .frame(width: 50, height: 50)
              )
          }
        }
        .padding()
      }
      .navigationTitle("Choisissez une couleur")
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .navigationBarLeading) {
          Button(action: { dismissColorSelectionView() }) {
            Image(systemName: "chevron.down")
              .foregroundColor(.primary)
          }
        }
      }
    }
  }
  
  private func selectColorAndDismiss(colorHex: String?) {
    selectedColorHex = colorHex
    dismissColorSelectionView()
  }
  
}

struct ColorSelectionView_Previews: PreviewProvider {
  @State static var selectedColorHex: String? = nil
  static var previews: some View {
    ColorSelectionView(selectedColorHex: $selectedColorHex)
  }
}
