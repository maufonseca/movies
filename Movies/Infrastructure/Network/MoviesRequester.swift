//
//  File.swift
//  Movies
//
//  Created by Ringa Sd on 08/06/2018.
//  Copyright © 2018 Mauricio Fonseca. All rights reserved.
//

import Foundation

class MoviesRequester {
  let presenter : SearchPresenter
  
  init(presenter:SearchPresenter) {
    self.presenter = presenter
  }
  
  func requestMovieList(query : String) {
    
    //Call API
    let movie1 = Movie.init()
    movie1.title = "Title 1"
    movie1.year = "2016"
    
    let movie2  = Movie.init()
    movie2.title = "Title 2"
    movie2.year = "2018"
    
    let movie3  = Movie.init()
    movie3.title = "Title 3"
    movie3.year = "2018"
    
    let movie4  = Movie.init()
    movie4.title = "Title 4"
    movie4.year = "2018"
    
    let responseArray = [movie1, movie2, movie3, movie4]
    
    //on API success
    presenter.updateMoviesArray(array:responseArray)
    
    //on API error
    //presenter.onError(_errorMessage: String)
  }
}
