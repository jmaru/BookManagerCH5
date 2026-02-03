//
//  BookDetailView.swift
//  BookManagerCH5
//
//  Created by Jorge Gabriel Marin Urias on 1/7/26.
//

import SwiftUI
import SwiftData

struct BookDetailView: View {
    var book: PersistentBook

    @State private var showEditSheet: Bool = false
    @State private var isFavorite: Bool
    
    @Environment(\.modelContext) private var modelContext
    
    init(book: PersistentBook) {
        self.book = book
        isFavorite = book.isFavorite
    }
    
    var body: some View {
        
        ScrollView{
            VStack(alignment: .leading) {
                HStack {
                    //Image
                    Image(uiImage: (book.cover != nil ? UIImage(data:book.cover!) : UIImage(resource: .defaultBookCover))!)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 150)
                        .padding(.vertical,20)
                    VStack{
                        //Title
                        Text(book.title.uppercased())
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
                            FavoriteToggle(isFavorite:$isFavorite)
                                .onChange(of: isFavorite) { _,newValue in
                                    book.isFavorite = newValue
                                    try? modelContext.save()
                                }
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
            AddEditView(book: book, modelContext: modelContext)
        }
    }
}
