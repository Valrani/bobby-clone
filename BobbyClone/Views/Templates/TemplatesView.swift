//
//  TemplatesView.swift
//  BobbyClone
//
//  Created by Antoine De Roose on 14/12/2021.
//

import SwiftUI

/// On affiche une HStack avec 2 vues.
/// Chaque vue a une largeur correspondante à tout l'écran, donc notre HStack fait virtuellement la taille de 2 écrans.
/// On peut changer l'affichage en appliquant un offset. Un offset de 0 affiche la 1ère vue de la stack.
/// Diminuer l'offset du HStack le fait se décaler vers la droite, ce qui permet au final d'aller faire glisser la 2eme vue etc.
/// On affiche une HStack avec 2 vues.
/// Chaque vue a une largeur correspondante à tout l'écran, donc notre HStack fait virtuellement la taille de 2 écrans.
/// On peut changer l'affichage en appliquant un offset. Un offset de 0 affiche la 1ère vue de la stack.
/// Diminuer l'offset du HStack le fait se décaler vers la droite, ce qui permet au final d'aller faire glisser la 2eme vue etc.
struct TemplatesView: View {
  
  /// View displayed when the view appear, where the first is 0, the second is 1 etc.
  @State private var viewDisplayed = 0
  /// Number of tabs
  private let numberOfTabs = 2
  /// The offset applied to the HStack to display the correct view (computed in onAppear)
  @State private var offset: CGFloat = .nan
  
  var body: some View {
    VStack(spacing: 0) {
      TemplatesTopView(viewDisplayed: $viewDisplayed)
      GeometryReader { gr in
        Group {
          HStack(spacing: 0) {
            TemplatesTab(popularOnly: false)
              .frame(width: gr.size.width)
            TemplatesTab(popularOnly: true)
              .frame(width: gr.size.width)
          }
          .offset(x: offset)
        }
        // Change the offset each time the viewDisplayed change.
        .onChange(of: viewDisplayed) { newValue in
          withAnimation {
            offset = -CGFloat(viewDisplayed) * gr.size.width
          }
        }
        // Initialize correctly the offset, depending on the viewDisplayed value.
        .onAppear {
          offset = -CGFloat(viewDisplayed) * gr.size.width
        }
        // Recompute the offset if the device orientation change.
        .onRotate { newOrientation in
          offset = -CGFloat(viewDisplayed) * UIScreen.main.bounds.width
        }
      }
      .edgesIgnoringSafeArea(.horizontal)
      TemplatesBottomView()
    }
  }
}

struct TemplatesView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      TemplatesView()
        .previewInterfaceOrientation(.landscapeRight)
      TemplatesView()
        .previewInterfaceOrientation(.portrait)
    }
  }
}
