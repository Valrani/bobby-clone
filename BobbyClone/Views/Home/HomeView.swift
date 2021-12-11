//
//  HomeView.swift
//  BobbyClone
//
//  Created by Antoine De Roose on 10/12/2021.
//

import SwiftUI

struct HomeView: View {

    @State private var isShowingSettingsSheet = false
    @State private var isShowingCategoriesSheet = false
    @State private var isShowingSubscriptionTemplatesSheet = false

    var body: some View {
        NavigationView {
            ScrollView {
                Text("Hello, World!")
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: showSettingsSheet) {
                        Image(systemName: "gearshape")
                            .foregroundColor(.secondary)
                    }
                    .sheet(isPresented: $isShowingSettingsSheet) {
                        SettingsView()
                    }
                }
                ToolbarItem(placement: .principal) {
                    Button(action: showCategoriesSheet) {
                        HStack {
                            Text("Toutes les souscriptions")
                                .fontWeight(.bold)
                            Image(systemName: "chevron.down")
                                .font(Font.caption2.weight(.bold))
                        }
                        .foregroundColor(.primary)
                    }
                    .sheet(isPresented: $isShowingCategoriesSheet) {
                        CategoriesView()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: showSubscriptionTemplatesSheet) {
                        Image(systemName: "plus")
                            .foregroundColor(.secondary)
                    }
                    .sheet(isPresented: $isShowingSubscriptionTemplatesSheet) {
                        SubscriptionTemplatesView()
                    }
                }
            }
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

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            
    }
}
