//
//  SearchPresenter.swift
//  Movies
//
//  Created by Ringa Sd on 08/06/2018.
//  Copyright © 2018 Mauricio Fonseca. All rights reserved.
//

import Foundation

class SearchPresenter {
  var controller : SearchViewController

  init(controller:SearchViewController) {
    self.controller = controller
  }
  
  func updateMoviesArray(array:Array<Movie>) {
    controller.updateMovieList(array: array)
  }
}
