//
//  BookManagerCH5App.swift
//  BookManagerCH5
//
//  Created by Jorge Gabriel Marin Urias on 1/7/26.
//

import SwiftUI
import SwiftData

@main
struct BookManagerCH5App: App {
    
    let modelContainer: ModelContainer
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(modelContainer)
        }
    }
    
    init(){
        do{
            modelContainer = try ModelContainer(
                for:
                    PersistentBook.self,
            )
        } catch {
            fatalError("Failed to load the model container")
        }
    }
}
