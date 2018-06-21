//
//  BookmarksTests.swift
//  MoviesTests
//
//  Created by Ringa Sd on 13/06/2018.
//  Copyright © 2018 Mauricio Fonseca. All rights reserved.
//

import XCTest
@testable import Movies

class BookmarkInteractorTests: XCTestCase {
  
  
  //Stub classes (mock)
  class MockOperator: BookmarkDiskOperator {
    var called = false
    override func getBookmarkList(presenter:MovieGridPresentationProtocol) {
      called = true
    }
  }
  
  //Objects used for testing
  var mockOperator : MockOperator?
  var interactorUnderTest : BookmarkInteractor?
  
  override func setUp() {
    super.setUp()
    mockOperator = MockOperator.init()
    interactorUnderTest = BookmarkInteractor.init(diskOperator: mockOperator!)
  }
  
  override func tearDown() {
    interactorUnderTest = nil
    mockOperator = nil
    super.tearDown()
  }
  
  func testLoadBookmarks() {
    //When calling the loadBookmarks() method in interactor, the diskOperactor getBookmarkList() should be called
    interactorUnderTest?.loadBookmarks(presenter: BookmarkPresenter.init(controller: BookmarkViewController.init()))
    XCTAssertTrue(mockOperator!.called)
  }
  
}
