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
    XCUIApplication().launch()
  }
  
  override func tearDown() {
    super.tearDown()
  }
  
  //This test will keep scrolling the movies for a while. If no error occurs, then it Passed
  func testInfiniteScroll() {
    let app = XCUIApplication()
    let collectionView = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .collectionView).element
    
    for _ in 1...10 {
      sleep(2)
      collectionView.swipeUp()
    }
    app.collectionViews.children(matching: .cell).element(boundBy:10).children(matching: .other).element.children(matching: .other).element.tap()
    
    let elementsQuery = app.scrollViews.otherElements
    elementsQuery.buttons["Marcar favorito"].tap()
    elementsQuery.buttons["Voltar"].tap()
    
    for _ in 1...10 {
      sleep(2)
      collectionView.swipeUp()
    }
    
  }
  
  //This test will make some actions through whole app, if no crashes occurs, then it passed
  func testAllActions() {
    let app = XCUIApplication()
    let collectionViewsQuery = app.collectionViews
    collectionViewsQuery.children(matching: .cell).element(boundBy: 8).children(matching: .other).element.children(matching: .other).element.tap()
    
    let scrollViewsQuery = app.scrollViews
    let elementsQuery = scrollViewsQuery.otherElements
    let marcarFavoritoButton = elementsQuery.buttons["Marcar favorito"]
    marcarFavoritoButton.tap()
    let desmarcarFavoritoButton = elementsQuery.buttons["Desmarcar favorito"]
    desmarcarFavoritoButton.tap()
    marcarFavoritoButton.tap()
    desmarcarFavoritoButton.tap()
    
    let comprarButton = app.buttons["Comprar"]
    comprarButton.tap()
    
    let voltarButton = elementsQuery.buttons["Voltar"]
    voltarButton.tap()
    voltarButton.tap()
    
    let tabBarsQuery = app.tabBars
    let filmesButton = tabBarsQuery.buttons["Filmes"]
    tabBarsQuery.buttons["Favoritos"].tap()
    sleep(2)
    collectionViewsQuery.children(matching: .cell).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.tap()
    desmarcarFavoritoButton.tap()
    marcarFavoritoButton.tap()
    comprarButton.tap()
    scrollViewsQuery.otherElements.containing(.button, identifier:"Voltar").element.tap()
    voltarButton.tap()
    voltarButton.tap()
    filmesButton.tap()
    
  }
}
