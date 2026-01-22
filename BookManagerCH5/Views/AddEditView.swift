//
//  AddEditView.swift
//  BookManagerCH5
//
//  Created by Jorge Gabriel Marin Urias on 1/12/26.
//

import SwiftUI

struct AddEditView: View {
    
    @Binding var book: Book
    @State var workingBook: Book
    @Environment(\.dismiss) var dismiss
    
    init(book: Binding<Book>) {
        _book = book
        _workingBook = .init(initialValue: book.wrappedValue)
    }

    var body: some View {
        NavigationStack{
            Form {
                Section(header: Text("Book details")){
                    TextField("Title of the book", text: $workingBook.title)
                    TextField("Author", text: $workingBook.author)
                    Picker("Genre", selection: $workingBook.genre){
                        ForEach(Genre.allCases, id: \.self) { genre in
                            Text(genre.rawValue).tag(genre)
                        }
                    }
                    
                    Picker("Reading Status", selection: $workingBook.readingStatus){
                        ForEach(ReadingStatus.allCases, id: \.self) { status in
                            Text(status.rawValue).tag(status)
                        }
                    }
                    TextEditor(text: $workingBook.details)
                        .frame(height: 150)
                }
                Section(header: Text("Book review")){
//                    Picker("Rating", selection: $workingBook.rating){
//                        Text("No rating selected").tag(0)
//                        ForEach(1...5, id: \.self) {
//                            Text("\($0) stars").tag($0)
//                        }
//                    }
                    StarRatingField(rating: $workingBook.rating)
                    TextEditor(text: $workingBook.review)
                        .frame(height: 150)
                }
            }
            .navigationTitle("Add/Edit Book")
            .toolbar{
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        //Saving the values into the actual book
                        book.title = workingBook.title
                        book.author = workingBook.author
                        book.details = workingBook.details
                        book.genre = workingBook.genre
                        book.readingStatus = workingBook.readingStatus
                        //Review lines added
                        book.rating = workingBook.rating
                        book.review = workingBook.review
                        // dismiss the sheet containing Add/Edit view
                        dismiss()
                    }.disabled(workingBook.title.isEmpty)
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }
    }
}
