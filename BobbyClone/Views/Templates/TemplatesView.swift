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
  
  /// Numbers of view, where the first is 0, the second is 1, the third is 2...
  @State var viewDisplayed = 0
  /// The offset applied to the HStack to display the correct view
  @State private var offset: CGFloat = 0
  
  var body: some View {
    ScrollView {
      // Top View
      HStack {
        Text("Go All")
          .onTapGesture { viewDisplayed = 0 }
        Spacer()
        Text("Go Popular")
          .onTapGesture { viewDisplayed = 1 }
        Spacer()
        Text("Go Nibba")
          .onTapGesture { viewDisplayed = 2 }
      }
      .padding()
      .background(.cyan)
      
      // Main View
      GeometryReader { gr in
        Group {
          HStack {
            All()
              .frame(width: gr.size.width)
            Popular()
              .frame(width: gr.size.width)
            Nibba()
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
        .onRotate { _ in
          // TODO: bug
          print("uiscreen bounds with : \(UIScreen.main.bounds.width)")
          print("old offet -> \(offset)")
          offset = -CGFloat(viewDisplayed) * UIScreen.main.bounds.width
          print("new offset -> \(offset)")
        }
      }
    }
    
  }
}












//struct TemplatesView: View {
//
//  /// Numbers of view, where the first is 0, the second is 1, the third is 2...
//  @State private var viewDisplayed = 1
//  /// The offset applied to the HStack to display the correct view
//  @State private var offset: CGFloat = 0
//
//  var body: some View {
//    VStack {
//      GeometryReader { gr in
//        Group {
//          HStack {
//            All() {
//              withAnimation {
//                viewDisplayed = 1
//                offset -= gr.size.width
//              }
//            }
//            .frame(width: gr.size.width)
//            Popular() {
//              withAnimation {
//                viewDisplayed = 0
//                offset += gr.size.width
//              }
//            }
//            .frame(width: gr.size.width)
//          }
//          .offset(x: offset)
//        }
//        .onAppear {
//          offset = -CGFloat(viewDisplayed) * gr.size.width
//        }
//        .onRotate { _ in
//          offset = -CGFloat(viewDisplayed) * gr.size.width
//        }
//      }
//    }
//
//    private func moveLeft(grWidth: CGFloat) {
//      // TODO: go fish
//    }
//
//    private func moveRight(grWidth: CGFloat) {
//      // TODO: go fish
//    }
//
//  }
//}













//        if (viewDisplayed == 0) {
//          print("nothing to do bcs offset == \(offset)")
//        }
//        if (viewDisplayed == 1) {
//          print("current offset -> \(offset)")
//          print("gr.size.width -> \(gr.size.width)")
//          offset = -gr.size.width
//        }

struct All: View {
  var body: some View {
    Text("All")
      .font(.title)
  }
}
struct Popular: View {
  var body: some View {
    Text("Popular")
      .font(.title)
  }
}

struct Nibba: View {
  var body: some View {
    Text("Nibba")
      .font(.title)
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
