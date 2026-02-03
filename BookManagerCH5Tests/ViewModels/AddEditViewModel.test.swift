//
//  AddEditViewModel.test.swift
//  BookManagerCH5
//
//  Created by Jorge Gabriel Marin Urias on 2/2/26.
//

import Testing
import SwiftData
@testable import BookManagerCH5

@MainActor
struct AddEditViewModelTests {
    
    @Test("View Model inits correctly for a new book")
    func testNewBookInit() throws {
        // arrange
        let container = try ModelContainer(
            for: PersistentBook.self,
            configurations: .init(isStoredInMemoryOnly: true)
        )
        let modelContext = container.mainContext
        
        // act
        let viewModel = AddEditViewModel(
            modelContext: modelContext
        )
        
        // assert
        #expect(viewModel.title == "")
        #expect(viewModel.author == "")
        /* expect all other attributes, as an assignment*/
        
        #expect(viewModel.navigationTitle == "Add book")
        #expect(viewModel.isNotSavable == true)
    }
    
    @Test("View Model init correctly for an existing book")
    func testExistingBookInit() throws {
        // arrange
        let container = try ModelContainer(
            for: PersistentBook.self,
            configurations: .init(isStoredInMemoryOnly: true)
        )
        let modelContext = container.mainContext
        let book = PersistentBook(title: "Test", author: "Test Author", rating:3, genre: .fantasy, isFavorite: true /* and the rest of the attributes*/)
        
        //act
        let viewModel = AddEditViewModel(
            book: book, // <- this is the difference of an existing book
            modelContext: modelContext
        )
        
        //assert
        #expect(viewModel.title == "Test")
        #expect(viewModel.author == "Test Author")
        #expect(viewModel.isFavorite == true)
        #expect(viewModel.genre == .fantasy)
        #expect(viewModel.rating == 3)
        /* the rest of the attributes as assignment*/
        
        #expect(viewModel.navigationTitle == "Edit book")
        #expect(viewModel.isNotSavable == true)
    }
    
    @Test("View Model saves correctly for a new book")
    func testAddNewBook() throws{
        // arrange
        let container = try ModelContainer(
            for: PersistentBook.self,
            configurations: .init(isStoredInMemoryOnly: true)
        )
        let modelContext = container.mainContext
        
        // act
        let viewModel = AddEditViewModel(
            modelContext: modelContext
        )
        viewModel.title = "New Title"
        viewModel.author = "New Author"
        /* the rest of the attributes, as assignment */
        viewModel.saveBook()
        
        // assert
        let descriptor = FetchDescriptor<PersistentBook>()
        let savedBooks = try modelContext.fetch(descriptor)
        
        #expect(savedBooks.count == 1)
        if let firstBook = savedBooks.first {
            #expect(firstBook.title == "New Title")
            #expect(firstBook.author == "New Author")
            /* the rest of the attributes, as assignment */
        }
    }
    
    @Test("View Model saves correctly an existing book")
    func testEditExistingBook() throws {
        //arrange
        let container = try ModelContainer(
            for: PersistentBook.self,
            configurations: .init(isStoredInMemoryOnly: true)
        )
        let modelContext = container.mainContext
        let book = PersistentBook(title: "Test", author: "Test Author", rating:3, genre: .fantasy, isFavorite: true /* and the rest of the attributes*/)
        modelContext.insert(book)
        try modelContext.save()
        
        // act
        let viewModel = AddEditViewModel(
            book: book,
            modelContext: modelContext
        )
        viewModel.title = "Updated Title"
        viewModel.author = "Updated Author"
        viewModel.saveBook()
        
        // assert
        let descriptor = FetchDescriptor<PersistentBook>()
        let savedBooks = try modelContext.fetch(descriptor)
        
        #expect(savedBooks.count == 1)
        if let firstBook = savedBooks.first {
            #expect(firstBook.title == "Updated Title")
            #expect(firstBook.author == "Updated Author")
            /* the rest of the attributes, as assignment */
        }
    }
    
    @Test("View Model isNotSavable works correctly for a new book")
    func testAddNewBook_isNotSavable() throws {
        // arrange
        let container = try ModelContainer(
            for: PersistentBook.self,
            configurations: .init(isStoredInMemoryOnly: true)
        )
        let modelContext = container.mainContext
        
        // act
        let viewModel = AddEditViewModel(
            modelContext: modelContext
        )
        
        #expect(viewModel.isNotSavable == true)
        
        viewModel.author = "Test Author"
        #expect(viewModel.isNotSavable == true)
        
        viewModel.title = "Test"
        #expect(viewModel.isNotSavable == false)
    }
    
    @Test("View Model isNotSavable works correctly for an existing book")
    func testEditExistingBook_isNotSavable() throws {
        let container = try ModelContainer(
            for: PersistentBook.self,
            configurations: .init(isStoredInMemoryOnly: true)
        )
        let modelContext = container.mainContext
        let book = PersistentBook(title: "Test", author: "Test Author", rating:3, genre: .fantasy, isFavorite: true /* and the rest of the attributes*/)
        
        //act
        let viewModel = AddEditViewModel(
            book: book, // <- this is the difference of an existing book
            modelContext: modelContext
        )
        
        // assert
        #expect(viewModel.isNotSavable == true)
        
        viewModel.author = "New Author"
        #expect(viewModel.isNotSavable == false)
        
        viewModel.author = "Test Author"
        #expect(viewModel.isNotSavable == true)
        
        /* other properties, as assignment */
    }
}
