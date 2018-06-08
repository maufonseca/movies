//
//  SearchMovieInteractor.swift
//  Movies
//
//  Created by Ringa Sd on 08/06/2018.
//  Copyright © 2018 Mauricio Fonseca. All rights reserved.
//

import Foundation

class SearchInteractor {
  let requester : MoviesRequester?
  
  init(requester:MoviesRequester) {
  self.requester = requester
  }
  
  func getResults(query:String) {
    requester?.requestMovieList(query: query)
  }
}
