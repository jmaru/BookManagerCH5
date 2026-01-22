//
//  FavoriteCard.swift
//  BookManagerCH5
//
//  Created by Jorge Gabriel Marin Urias on 1/17/26.
//

import SwiftUI

struct FavoriteCard: View {
    let book: Book
    
    var body: some View {
        VStack{
            Text(book.title)
                .lineLimit(1)
                .foregroundColor(.gray)
            Image(book.cover)
                .resizable()
                .scaledToFill()
                .frame(height: 200)
                .aspectRatio(1, contentMode: .fit)
            Text(book.author)
                .foregroundColor(.gray)
        }
//        .border(Color.gray)
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.5), radius: 10, x: 0, y: 5)
        
    }
}
