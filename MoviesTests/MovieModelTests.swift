//
//  MoviesTests.swift
//  MoviesTests
//
//  Created by Ringa Sd on 08/06/2018.
//  Copyright © 2018 Mauricio Fonseca. All rights reserved.
//

import XCTest
@testable import Movies

class MovieModelTests: XCTestCase {
  
  var movieUnderTest : Movie?
  
  override func setUp() {
    super.setUp()
    movieUnderTest = Movie.init()
  }
  
  override func tearDown() {
    movieUnderTest = nil
    super.tearDown()
  }
  
  func testYearReturn() {
    movieUnderTest?.releaseDate = "2016-2-2"
    var year = movieUnderTest?.getReleaseYear()
    XCTAssert(year!=="2016")
    
    movieUnderTest?.releaseDate = "2006/12/12"
    year = movieUnderTest?.getReleaseYear()
    XCTAssert(year!=="2006")
    
    movieUnderTest?.releaseDate = "1998-2-12"
    year = movieUnderTest?.getReleaseYear()
    XCTAssert(year!=="1998")
    
  }
  
  func testPerformanceExample() {
    // This is an example of a performance test case.
    self.measure {
      // Put the code you want to measure the time of here.
    }
  }
  
}
