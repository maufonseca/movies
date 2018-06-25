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
  
  var movieUnderTest : Movie!
  
  override func setUp() {
    super.setUp()
    movieUnderTest = Movie.init()
  }
  
  override func tearDown() {
    movieUnderTest = nil
    super.tearDown()
  }
  
  func testYearReturn() {
    movieUnderTest.releaseDate = "2016-2-2"
    var year = movieUnderTest.getReleaseYear()
    XCTAssert(year=="2016")
    
    movieUnderTest.releaseDate = "2006/12/12"
    year = movieUnderTest.getReleaseYear()
    XCTAssert(year=="2006")
    
    movieUnderTest.releaseDate = "1998-2-12"
    year = movieUnderTest.getReleaseYear()
    XCTAssert(year=="1998")
    
  }
  
  func testDictionaryParse() {
    
    let dict : Dictionary<String, Any> = ["vote_count":439,"id":351286,"video":false,"vote_average":6.7,"title":"Jurassic World: Reino Ameaçado","popularity":288.186315,"poster_path":"/nR6LhLKk5BsholuIHIAGemMKPKy.jpg","original_language":"en","original_title":"Jurassic World: Fallen Kingdom","genre_ids":[28,12,878],"backdrop_path":"/t0Kn7twXduHeFhOpTW2Gncu9l5F.jpg","adult":false,"overview":"Quatro anos após o fechamento do Jurassic Park, um vulcão prestes a entrar em erupção põe em risco a vida na ilha Nublar. No local não há mais qualquer presença humana, com os dinossauros vivendo livremente. Diante da situação, é preciso tomar uma decisão: deve-se retornar à ilha para salvar os animais ou abandoná-los para uma nova extinção? Decidida a resgatá-los, Claire (Bryce Dallas Howard) convoca Owen (Chris Pratt) a retornar à ilha com ela.","release_date":"2018-06-06"]
    
    let nsDict = dict as NSDictionary
    
    movieUnderTest = Movie.init(fromDictionary: nsDict)
    XCTAssert(movieUnderTest.id == 351286)
    XCTAssert(movieUnderTest.title == "Jurassic World: Reino Ameaçado")
    XCTAssert(movieUnderTest.bookmarked == false)
    XCTAssert(movieUnderTest.getReleaseYear()=="2018")
    XCTAssert(movieUnderTest.overview == "Quatro anos após o fechamento do Jurassic Park, um vulcão prestes a entrar em erupção põe em risco a vida na ilha Nublar. No local não há mais qualquer presença humana, com os dinossauros vivendo livremente. Diante da situação, é preciso tomar uma decisão: deve-se retornar à ilha para salvar os animais ou abandoná-los para uma nova extinção? Decidida a resgatá-los, Claire (Bryce Dallas Howard) convoca Owen (Chris Pratt) a retornar à ilha com ela.")
  }
  
  
  
}
