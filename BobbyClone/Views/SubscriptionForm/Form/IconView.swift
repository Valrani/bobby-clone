//
//  IconView.swift
//  BobbyClone
//
//  Created by Antoine De Roose on 15/12/2021.
//

import SwiftUI

struct IconView: View {
  
  @Binding var selectedIconString: String
  
  @Environment(\.dismiss) private var dismissIconView
  @State private var searchText = ""
  
  private var filteredIcons: [String] {
    guard !searchText.isEmpty else { return sfSymbols }
    return sfSymbols.filter { $0.localizedCaseInsensitiveContains(searchText) }
  }
  
  private let gridLayout = [
    GridItem(.adaptive(minimum: 50), spacing: 40, alignment: .center)
  ]
  
  var body: some View {
    NavigationView {
      ScrollView {
        LazyVGrid(columns: gridLayout) {
          ForEach(filteredIcons, id: \.self) { icon in
            Button(action: { selectIconAndDismiss(iconString: icon) }) {
              Image(systemName: icon)
                .foregroundColor(.primary)
                .font(.title)
                .padding()
            }
          }
        }
        .padding()
      }
      .navigationTitle("Choisissez une icône")
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .navigationBarLeading) {
          Button(action: { dismissIconView() }) {
            Image(systemName: "chevron.down")
              .foregroundColor(.primary)
          }
        }
      }
      .searchable(text: $searchText,placement: .navigationBarDrawer(displayMode: .always), prompt: "Chercher par nom")
    }
  }
  
  private func selectIconAndDismiss(iconString: String) {
    selectedIconString = iconString
    dismissIconView()
  }
  
}

struct IconView_Previews: PreviewProvider {
  @State static var selectedIconString = ""
  static var previews: some View {
    //Text("Preview can be slow due to the number of icons")
    IconView(selectedIconString: $selectedIconString)
  }
}
