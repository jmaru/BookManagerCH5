//
//  ContentView.swift
//  BookManagerCH5
//
//  Created by Jorge Gabriel Marin Urias on 1/7/26.
//

import SwiftUI

struct ContentView: View {
    
    @State var books = getBooks()
    
    var body: some View {
        TabView{
            //Book list view
            BookListView(books: $books)
                .tabItem{
                    Label("Books", systemImage: "books.vertical.fill")
                }
            // Favorites view
            FavoritesView(books: $books)
                .tabItem{
                    Label("Favorites", systemImage: "heart.fill")
                }
        }
    }

}
