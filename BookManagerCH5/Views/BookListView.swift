//
//  BookListView.swift
//  BookManagerCH5
//
//  Created by Jorge Gabriel Marin Urias on 1/17/26.
//

import SwiftUI

struct BookListView: View {
    @Binding var books: [Book]
    @State var showAddSheet: Bool = false
    @State var newBook: Book = Book(title:"")
    
    var body: some View {
        // book: copy of the wrapped value
        // $book: the actual binding to the book
        NavigationStack{
            List($books, id: \.self.id){ $book in
                NavigationLink(destination: BookDetailView(book: $book)){
                    //List item
                    BookListItem(book: book)
                }
            }
            .navigationTitle(Text("Book Manager"))
            .navigationBarItems(trailing: Button("Add"){
                showAddSheet.toggle()
            })
            .sheet(isPresented: $showAddSheet)
            { //onDismiss
                if(!newBook.title.isEmpty){
                    books.append(newBook)
                }
                newBook = Book(title: "")
            }
            content:{
                AddEditView(book: $newBook)
            }
        }
    }
}

