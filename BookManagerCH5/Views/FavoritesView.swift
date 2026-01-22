//
//  FavoritesView.swift
//  BookManagerCH5
//
//  Created by Jorge Gabriel Marin Urias on 1/17/26.
//

import SwiftUI

struct FavoritesView: View {
    
    @Binding var books: [Book]
    
    @State private var showFilterSheet = false
    @State var selectedGenre: Genre? = nil
    @State var selectedReadingStatus: ReadingStatus? = nil
    
    let layout = [GridItem(.flexible()), GridItem(.flexible())]
    
    //computed property
    private var favoriteBooks: [Binding<Book>] {
        $books.filter{
            $0.wrappedValue.isFavorite
            // $0 = binding to the book
            // .wrappedValue = the actual book
            // .isFavorite = property isFavorite of the book
        }
    }
    
    var body: some View {
        NavigationStack{
            HStack{
//                Text("Filters applied:")
                if(selectedGenre != nil){
                    Text("Genre: \(selectedGenre!.rawValue)")
                }
                if(selectedReadingStatus != nil){
                    Text("Status: \(selectedReadingStatus!.rawValue)")
                }
            }
            ScrollView {
                LazyVGrid(columns: layout){
                    ForEach(favoriteBooks, id:\.self.wrappedValue.id){ book in
                        NavigationLink(destination: BookDetailView(book: book)){
                            FavoriteCard2(book: book.wrappedValue)
                                .padding()
                        }
                    }
                }
            }
            .navigationTitle("My favorite books")
            .toolbar{
                ToolbarItem(placement: .topBarLeading){
                    Button(action:{ showFilterSheet.toggle() }){
                        Image(systemName: "line.horizontal.3.decrease.circle")
                    }
                }
            }
            .sheet(isPresented: $showFilterSheet){
                FilterView(selectedGenre: $selectedGenre, selectedReadingStatus: $selectedReadingStatus)
            }
        }
    }
}
