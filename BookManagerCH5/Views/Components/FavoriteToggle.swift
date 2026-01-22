//
//  FavoriteToggle.swift
//  BookManagerCH5
//
//  Created by Jorge Gabriel Marin Urias on 1/17/26.
//

import SwiftUI

struct FavoriteToggle: View {
    @Binding var isFavorite: Bool
    
    @State private var scale: CGFloat = 1
    @State private var opacity: CGFloat = 0
    @State private var offsetY: CGFloat = 0
    
     var body: some View {
         ZStack{
             Image(systemName:"heart.fill")
                 .foregroundStyle(.red)
                 .font(.largeTitle)
                 .opacity(opacity) //1 fully opaque; 0 fully transparent
                 .scaleEffect(scale)
                 .offset(y: offsetY)
             Toggle(isOn: $isFavorite) {
                 Image(systemName: isFavorite ? "heart.fill" : "heart")
                     .foregroundColor(isFavorite ? .red : .gray)
             }
             .toggleStyle(.button)
             .buttonStyle(.plain)
             .animation(.spring, value: isFavorite)
             .accessibilityLabel(isFavorite ? "Remove to favorites" : "Add to favorites")
             .onChange(of: isFavorite) { oldValue, newValue in
                 guard newValue == true else { return }
                 
                 // appear and grow
                 withAnimation(.spring(response: 0.5, dampingFraction: 0.3)){
                     opacity = 1
                     scale = 1.2
                 }
                 //float and vanish
                 withAnimation(.easeInOut(duration:0.5).delay(0.5)){
                     offsetY = -100
                     opacity = 0
                 }
                 
                 // Do this after animation has finished or after 1 second
                 DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                     scale = 1
                     offsetY = 0
                 }
             }
         }
    }
}
