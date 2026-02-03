//
//  AddEditViewModel.swift
//  BookManagerCH5
//
//  Created by Jorge Gabriel Marin Urias on 2/2/26.
//

import SwiftUI
import SwiftData
internal import Combine

@MainActor
class AddEditViewModel: ObservableObject {
    
    private var bookToEdit: PersistentBook?
    private let modelContext: ModelContext
    
    @Published var title: String = ""
    @Published var author: String = ""
    @Published var genre: Genre = .unknown
    @Published var readingStatus: ReadingStatus = .unknown
    @Published var details: String = ""
    @Published var rating: Int = 0
    @Published var review: String = ""
    @Published var isFavorite: Bool = false
    @Published var coverUI: UIImage?
    
    var navigationTitle: String {
        bookToEdit == nil ? "Add book" : "Edit book"
    }
    
    var isNotSavable: Bool {
        title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || (title == bookToEdit?.title)
        && author == bookToEdit?.author
        && genre == bookToEdit?.genre
        && readingStatus == bookToEdit?.readingStatus
        && details == bookToEdit?.details
        && rating == bookToEdit?.rating
        && review == bookToEdit?.review
        && isFavorite == bookToEdit?.isFavorite
    }
    
    init(book: PersistentBook? = nil, modelContext: ModelContext){
        self.bookToEdit = book
        self.modelContext = modelContext
        
        if let book { //let book = book OR book !=nil
            self.title = book.title
            self.author = book.author
            self.genre = book.genre
            self.readingStatus = book.readingStatus
            self.details = book.details
            self.rating = book.rating
            self.review = book.review
            self.isFavorite = book.isFavorite
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
            self.isFavorite = false
            self.coverUI = nil
        }
    }
    
    func saveBook() {
        //Saving the values into the actual book
        let isNewBook = bookToEdit == nil
        //If we don't have a book, we create one (Add Book)
        let bookToSave = bookToEdit ?? PersistentBook(title:"")
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
    }
}
