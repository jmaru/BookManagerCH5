//
//  AddEditView.swift
//  BookManagerCH5
//
//  Created by Jorge Gabriel Marin Urias on 1/12/26.
//

import SwiftUI
import SwiftData

struct AddEditView: View {
    
    var book: PersistentBook?
//    @State var workingBook: Book
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var modelContext
    
    @State private var title: String
    @State private var author: String
    @State private var genre: Genre
    @State private var readingStatus: ReadingStatus
    @State private var details: String
    @State private var rating: Int
    @State private var review: String
    @State private var coverUI: UIImage?
    
    private var viewTitle: String
    // closure
    init(book: PersistentBook? = nil) {
        self.book = book
        print(book?.title ?? "no book")
        if let book {
            print("Is getting here?")
            self.title = book.title
            self.author = book.author
            self.genre = book.genre
            self.readingStatus = book.readingStatus
            self.details = book.details
            self.rating = book.rating
            self.review = book.review
            viewTitle="Edit book"
            if let coverData = book.cover {
                self.coverUI = UIImage(data: coverData)
            }
        } else {
            self.title = ""
            self.author = ""
            self.genre = .unknown
            self.readingStatus = .unknown
            self.details = ""
            self.rating = 0
            self.review = ""
            viewTitle="Add new book"
            self.coverUI = nil
        }
        print("title")
        print(self.title)
//        _workingBook = .init(initialValue: book.wrappedValue)
    }

    var body: some View {
        NavigationStack{
            Form {
                Section(header: Text("Book cover")){
                    ImagePicker(image: $coverUI)
                }
                Section(header: Text("Book details")){
                    TextField("Title of the book", text: $title)
                    TextField("Author", text: $author)
                    Picker("Genre", selection: $genre){
                        ForEach(Genre.allCases, id: \.self) { genre in
                            Text(genre.rawValue).tag(genre)
                        }
                    }
                    
                    Picker("Reading Status", selection: $readingStatus){
                        ForEach(ReadingStatus.allCases, id: \.self) { status in
                            Text(status.rawValue).tag(status)
                        }
                    }
                    TextEditor(text: $details)
                        .frame(height: 150)
                }
                Section(header: Text("Book review")){
//                    Picker("Rating", selection: $workingBook.rating){
//                        Text("No rating selected").tag(0)
//                        ForEach(1...5, id: \.self) {
//                            Text("\($0) stars").tag($0)
//                        }
//                    }
                    StarRatingField(rating: $rating)
                    TextEditor(text: $review)
                        .frame(height: 150)
                }
            }
            .navigationTitle(viewTitle)
            .toolbar{
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        //Saving the values into the actual book
                        let isNewBook = book == nil
                        //If we don't have a book, we create one (Add Book)
                        let bookToSave = book ?? PersistentBook(title:"")
                        bookToSave.title = title
                        bookToSave.author = author
                        bookToSave.details = details
                        bookToSave.genre = genre
                        bookToSave.readingStatus = readingStatus
                        //Review lines added
                        bookToSave.rating = rating
                        bookToSave.review = review
                        if(coverUI != nil){
                            bookToSave.cover = coverUI?.jpegData(compressionQuality: 0.8)
                        }
                        
                        if isNewBook {
                            modelContext.insert(bookToSave)
                        }
                        
                        do {
                            try modelContext.save()
                        } catch {
                            print("Failed to save the book: \(error)")
                        }
                        // dismiss the sheet containing Add/Edit view
                        dismiss()
                    }.disabled(title.isEmpty)
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
