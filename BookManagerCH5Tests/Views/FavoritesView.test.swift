//
//  FavoritesView.test.swift
//  BookManagerCH5
//
//  Created by Jorge Gabriel Marin Urias on 1/31/26.
//

import Testing
@testable import BookManagerCH5

@MainActor @Suite("Favorite View Testing")
struct FavoritesViewTests {
    
    @Test("No filter is applied")
    func noFilterIsApplied() {
        let books = [
            PersistentBook(title:"Book 1"),
            PersistentBook(title:"Book 2", isFavorite: true),
            PersistentBook(title:"Book 3"),
        ]
        
        //act
        let filteredBooks = filterFavoriteBooks(books: books, useFavorite: false)
        
        //assert
        #expect(filteredBooks.count == 3)
    }
    
    @Test("Filter books with favorites")
    func filterBooksWithFavorites() {
        //arrange
        let books = [
            PersistentBook(title:"Book 1"),
            PersistentBook(title:"Book 2", isFavorite: true),
            PersistentBook(title:"Book 3"),
            PersistentBook(title:"Book 4", isFavorite: true),
        ]
        
        //act
        let filteredBooks = filterFavoriteBooks(books: books, useFavorite: true)
        
        //assert
        #expect(filteredBooks.count == 2)
        #expect(filteredBooks.first?.title == "Book 2")
        #expect(filteredBooks[1].title == "Book 4")
    }
    
    @Test("Filter books by genre")
    func filterBooksByGenre() {
        //arrange
        let books = [
            PersistentBook(title:"Book 1"),
            PersistentBook(title:"Book 2", isFavorite: true),
            PersistentBook(title:"Book 3", genre: .fantasy),
            PersistentBook(title:"Book 4", genre: .horror, isFavorite: true),
        ]
        
        //act
        let filteredBooks = filterFavoriteBooks(books: books, genre: .fantasy)
        //assert
        #expect(filteredBooks.count == 1)
        #expect(filteredBooks.first?.title == "Book 3")
        
        
        //act II
        let filteredBooks2 = filterFavoriteBooks(books: books, genre: .unknown)
        //assert II
        #expect(filteredBooks2.count == 2)
        #expect(filteredBooks2.first?.title == "Book 1")
        #expect(filteredBooks2[1].title == "Book 2")
        
        
        //act III
        let filteredBooks3 = filterFavoriteBooks(books: books, genre: .horror)
        //assert III
        #expect(filteredBooks3.count == 1)
        #expect(filteredBooks3.first?.title == "Book 4")
        
        //act III
        let filteredBooks4 = filterFavoriteBooks(books: books, genre: .dystopian)
        //assert III
        #expect(filteredBooks4.count == 0)
    }
    
    @Test("Filter books by reading status")
    func filterBooksByReadingStatus(){
        //Part of the assignment
    }
    
    // ???
}
