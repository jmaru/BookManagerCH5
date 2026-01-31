//
//  FavoriteCard2.swift
//  BookManagerCH5
//
//  Created by Jorge Gabriel Marin Urias on 1/21/26.
//

import SwiftUI

struct FavoriteCard2: View {
    let book: PersistentBook
    
    var body: some View {
        VStack{
            Text(book.title)
                .frame(maxWidth: .infinity)
                .font(.headline)
                .foregroundColor(.white)
                .lineLimit(2)
                .multilineTextAlignment(.center)
                .padding()
                .background(LinearGradient(
                    colors: [.black.opacity(0.8), .clear],
                    startPoint: .top,
                    endPoint: .bottom
                ))
            Spacer()
            Text(book.author)
                .frame(maxWidth: .infinity)
                .font(.subheadline)
                .foregroundColor(.white)
                .lineLimit(1)
                .padding(4)
                .background(LinearGradient(
                    colors: [.black.opacity(0.8), .clear],
                    startPoint: .bottom,
                    endPoint: .top
                ))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background{
            Image(uiImage: (book.cover != nil ? UIImage(data: book.cover!)! : UIImage(resource: .defaultBookCover)))
                .resizable()
                .scaledToFill()
        }
        .aspectRatio(1, contentMode: .fit)
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.5), radius: 10, x: 0, y: 5)
        
    }
}

