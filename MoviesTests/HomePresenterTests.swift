//
//  ResponseErrorTests.swift
//  MoviesTests
//
//  Created by Ringa Sd on 13/06/2018.
//  Copyright © 2018 Mauricio Fonseca. All rights reserved.
//

import XCTest
@testable import Movies

class HomePresenterTests: XCTestCase {
  
  
  //Stub classes (mock)
  class MockViewController: HomeViewController {
    var showedMessage = false //Will be true when showMessage() got called
    var updatedArray = false //Will be true when updateMovieList() got called
    var pausedScroll = false //Will be true when pauseInfiniteScroll() got called
    override func showMessage(message: String) {
      showedMessage = true
    }
    override func updateMovieList(array: Array<Movie>) {
      updatedArray = true
    }
    override func pauseInfiniteScroll() {
      pausedScroll = true
    }
  }
  
  //Objects used for testing
  var mockViewController : MockViewController!
  var presenterUnderTest : HomePresenter!
  var moviesRequester : MoviesRequester!
  
  override func setUp() {
    super.setUp()
    mockViewController = MockViewController.init()
    presenterUnderTest = HomePresenter.init(controller: mockViewController)
    moviesRequester = MoviesRequester.init(presenter: presenterUnderTest)
  }
  
  override func tearDown() {
    moviesRequester = nil
    presenterUnderTest = nil
    mockViewController = nil
    super.tearDown()
  }
  
  func testErrorMessage() {
    //When the movies requester pass an error to the presenter,
    //assert the Home viewController showed the error message
    moviesRequester.presenter.gotError(message: "erro")
    XCTAssertTrue(mockViewController.showedMessage)
    //assert the Home viewController paused the infiniteScroll page count
    XCTAssertTrue(mockViewController.pausedScroll)
  }
  
  func testSuccessResponse() {
    //When the requester pass a Movies array to the presenter
    //Assert that the movies list will be updated in the viewController
    moviesRequester.presenter.updateMoviesArray(array: [])
    XCTAssertTrue(mockViewController.updatedArray)
  }
  
}
