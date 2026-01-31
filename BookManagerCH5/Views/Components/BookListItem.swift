//
//  BookListItem.swift
//  BookManagerCH5
//
//  Created by Jorge Gabriel Marin Urias on 1/14/26.
//

import SwiftUI

struct BookListItem: View {
    let book: PersistentBook
    
    var body: some View {
        HStack(){
            Image(uiImage: book.cover != nil ? UIImage(data: book.cover!)! : UIImage(resource: .defaultBookCover))
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 60, maxHeight: 60)
            VStack(alignment: .leading){
                Text(book.title)
                    .lineLimit(1)
                StarRatingView(rating: book.rating).font(.footnote)
            }
        }
    }
}
