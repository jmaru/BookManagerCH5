//
//  BookListView.swift
//  BookManagerCH5
//
//  Created by Jorge Gabriel Marin Urias on 1/17/26.
//

import SwiftUI
import SwiftData

struct BookListView: View {
    @Query var books: [PersistentBook]
    @State var showAddSheet: Bool = false
    @Environment(\.modelContext) private var modelContext: ModelContext
    
    var body: some View {
        // book: copy of the wrapped value
        // $book: the actual binding to the book
        NavigationStack{
            List(books, id: \.self.id){ book in
                NavigationLink(destination: BookDetailView(book: book)){
                    //List item
                    BookListItem(book: book)
                }
            }
            .navigationTitle(Text("Book Manager"))
            .navigationBarItems(trailing:
                Button("Add"){
                    showAddSheet.toggle()
                }
                .accessibilityLabel("Add Book")
            )
            .sheet(isPresented: $showAddSheet){
                AddEditView(modelContext: modelContext)
            }
        }
    }
}

