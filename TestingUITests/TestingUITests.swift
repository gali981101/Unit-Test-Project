//
//  TestingUITests.swift
//  TestingUITests
//
//  Created by Terry Jason on 2023/9/9.
//

import XCTest

final class TestingUITests: XCTestCase {

    func testToDoItem() throws {
        
        let app = XCUIApplication()
        app.launch()
        
        
        let addButton = app.navigationBars["Testing.View"].buttons["Add"]
        
        let elementsQuery = app.alerts["Add Item"].scrollViews.otherElements
        let textField = elementsQuery.collectionViews.textFields["Enter Item"]
            
        let okButton = elementsQuery.buttons["submit"]
            
        let addedCell = app.tables.cells.containing(.staticText, identifier: "Gali").element
        
        addButton.tap()
        textField.tap()
        
        textField.typeText("Gali")
        okButton.tap()
        
        XCTAssert(addedCell.exists)
        
    }

    func testDeleteItem() throws {
        
        let app = XCUIApplication()
        app.launch()
        
        let addButton = app.navigationBars["Testing.View"].buttons["Add"]
        
        let elementsQuery = app.alerts["Add Item"].scrollViews.otherElements
        let textField = elementsQuery.collectionViews.textFields["Enter Item"]
            
        let okButton = elementsQuery.buttons["submit"]
            
        let addedCell = app.tables.cells.containing(.staticText, identifier: "Gali").element
        
        // tables
        let tablesQuery = app.tables
        let deleteButton = tablesQuery.buttons["Delete"]
        
        addButton.tap()
        textField.tap()
        
        textField.typeText("Gali")
        okButton.tap()
        
        // Delete
        addedCell.swipeLeft()
        deleteButton.tap()
        
        XCTAssertFalse(addedCell.exists)
        
    }
    
}
