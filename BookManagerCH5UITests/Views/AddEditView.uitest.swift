//
//  AddEditView.uitest.swift
//  BookManagerCH5
//
//  Created by Jorge Gabriel Marin Urias on 2/4/26.
//

import XCTest

class AddEditView_UITests: XCTestCase {
    
    override func setUpWithError() throws {
        
        continueAfterFailure = false
    }
    
    func testAddBookWorks() throws {
        let app = XCUIApplication()
        app.launch()
        
        let beforeAddingBookCount = app.collectionViews.firstMatch.cells.count
        let addButton = app.buttons["Add Book"]
        addButton.tap()
        let saveButton = app.buttons["Save"]
        
        //Check if the save button is disabled
        XCTAssertTrue(!saveButton.isEnabled)
        
        let titleTextField = app.textFields["Title of the book"]
        let newTitle = "New Book \(beforeAddingBookCount+1)"
        titleTextField.tap()
        titleTextField.typeText(newTitle)
        saveButton.tap()
        
        let afterAddingBookCount = app.collectionViews.firstMatch.cells.count
        XCTAssertEqual(afterAddingBookCount, beforeAddingBookCount+1)
        
        let lastBookCellTitle = app.collectionViews.firstMatch.cells.element(boundBy: afterAddingBookCount-1).staticTexts.firstMatch.label
        XCTAssertEqual(newTitle, lastBookCellTitle)
        
        let lastBookCellTitle2 = app.collectionViews.firstMatch.cells.element(boundBy: afterAddingBookCount-1).staticTexts[newTitle].label
        XCTAssertTrue(!lastBookCellTitle2.isEmpty)
    }
}
