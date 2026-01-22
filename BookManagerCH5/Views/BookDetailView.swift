//
//  BookDetailView.swift
//  BookManagerCH5
//
//  Created by Jorge Gabriel Marin Urias on 1/7/26.
//

import SwiftUI

struct BookDetailView: View {
    @Binding var book: Book

    @State var showEditSheet: Bool = false

    var body: some View {
        
        ScrollView{
            VStack(alignment: .leading) {
                HStack {
                    //Image
                    Image(book.cover) //Image("lotr_fellowship")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 150)
                        .padding(.vertical,20)
                    VStack{
                        //Title
                        Text(book.title)
                            .font(.largeTitle)
                        // by author
                        Text("by \(book.author)")
                            .font(.headline)
                            .foregroundColor(.secondary)
                        //Put the genre over here
                        HStack{
                            CustomCapsule(text: book.genre.rawValue)
                            CustomCapsule(text: book.readingStatus.rawValue, color: .red)
                            //Favorite toggle
                            FavoriteToggle(isFavorite:$book.isFavorite)
                        }
                    }
                }
                // Details
                Text(book.details)
                
                //This is for the review fields
                Text("Review")
                    .font(.title2)
                    .padding(.vertical)
//                Text("\(book.rating) \(book.rating == 1 ? "star" : "stars")")
                StarRatingView(rating: book.rating)
                    .padding(.bottom)
                Text(book.review)
            }
        }
        .navigationBarItems(trailing: Button("Edit") {
            showEditSheet.toggle()
        })
        .sheet(isPresented: $showEditSheet) {
            AddEditView(book: $book)
        }
    }
}
