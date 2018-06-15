//
//  MoviesUITests.swift
//  MoviesUITests
//
//  Created by Ringa Sd on 08/06/2018.
//  Copyright © 2018 Mauricio Fonseca. All rights reserved.
//

import XCTest

@available(iOS 9.0, *)
class MoviesUITests: XCTestCase {
  
  override func setUp() {
    super.setUp()
    continueAfterFailure = false
    let app = XCUIApplication()
    //Testing will be in english to prevent localized string problems
    app.launchArguments = ["-AppleLanguages", "en"]
    app.launch()
  }
  
  override func tearDown() {
    super.tearDown()
  }
  
  //This test will keep scrolling the movies for a while. If no error occurs, then it Passed
  func testAddFavorites() {
    let app = XCUIApplication()
    let tabBarsQuery = app.tabBars
    let bookmarksButton = tabBarsQuery.buttons.element(at: 1)
    bookmarksButton.tap()
    let elementsQuery = app.scrollViews.otherElements
    
    //remove all bookmarks to start in clean state
    let firstCell = app.collectionViews.children(matching: .any).element(boundBy: 0) //first cell
    while firstCell.exists {
      //enter detail
      firstCell.tap()
      //remove first bookmark
      elementsQuery.buttons["Remove Bookmark"].tap()
      //back to bookmarks screen
      let voltarButton = elementsQuery.buttons["Back"]
      voltarButton.tap()
    }
    
    let moviesButton = tabBarsQuery.buttons.element(at: 0)
    //go to mopvies section
    moviesButton.tap()
    //enter first movie details
    firstCell.tap()
    //get movie title
    let movieTitle = app.scrollViews.otherElements.staticTexts.element(at: 0).label
    //add movie to bookmark
    elementsQuery.buttons["Add Bookmark"].tap()
    //go back to collection view
    elementsQuery.buttons["Back"].tap()
    //enter bookmarks section
    bookmarksButton.tap()
    //enter first bookmark details
    firstCell.tap()
    //get bookmark title
    let bookmarkTitle = app.scrollViews.otherElements.staticTexts.element(at: 0).label
    //check if bookmark movie is the same movie added to bookmarks
    XCTAssert(bookmarkTitle == movieTitle)
    
  }
  
  //This test will make some actions through whole app, if no crashes occurs, then it passed
  func testAllScreens() {
    
    let app = XCUIApplication()
    let tabBarsQuery = app.tabBars
    
    
    let bookmarkButton = tabBarsQuery.buttons.element(at: 1) //bookmark button
    bookmarkButton.tap()
    
    let moviesButton = tabBarsQuery.buttons.element(at: 0) //movies button
    moviesButton.tap()
    
    let firstCell = app.collectionViews.children(matching: .any).element(boundBy: 0) //first cell
    if firstCell.exists {
      firstCell.tap()
    }
    
    let buyButton = app.buttons["Buy"]
    buyButton.tap()
    
    let backButton = app.scrollViews.otherElements.buttons["Back"]
    backButton.tap()
    backButton.tap()
    bookmarkButton.tap()
    firstCell.tap()
    buyButton.tap()
    backButton.tap()
    backButton.tap()
    moviesButton.tap()
    
  }
}
