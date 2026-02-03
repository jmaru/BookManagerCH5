//
//  PersistentBook.test.swift
//  BookManagerCH5
//
//  Created by Jorge Gabriel Marin Urias on 1/31/26.
//

import Testing
@testable import BookManagerCH5

@MainActor @Suite("Persistent Book tests")
struct PersistentBookTests {
    @Test("Persistent book init")
    func persistentBookInit() {
        // Arrange
        let title = "Test Book"
        let author = "Jane Doe"
        let defaultRating = 0
        
        // Act
        let book = PersistentBook(title: title, author: author)
        
        // Assert
        #expect(book.title == "Test Book")
        #expect(book.author == "Jane Doe")
        #expect(book.rating == defaultRating)
        
        //
    }
    
}
