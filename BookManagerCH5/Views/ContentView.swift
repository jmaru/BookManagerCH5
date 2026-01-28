//
//  ContentView.swift
//  BookManagerCH5
//
//  Created by Jorge Gabriel Marin Urias on 1/7/26.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage(SETTING_THEME_KEY) private var currentTheme: Theme = .system
//    @State var books = getBooks()
    
    var body: some View {
        TabView{
            //Book list view
            BookListView()
                .tabItem{
                    Label("Books", systemImage: "books.vertical.fill")
                }
            // Favorites view
//            FavoritesView()
//                .tabItem{
//                    Label("Favorites", systemImage: "heart.fill")
//                }
            // Settings View
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gearshape.fill")
                }
        }
        .preferredColorScheme(currentTheme.colorScheme())
    }

}
