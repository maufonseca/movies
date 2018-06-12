//
//  BookmarkPresenter.swift
//  Movies
//
//  Created by Ringa Sd on 11/06/2018.
//  Copyright © 2018 Mauricio Fonseca. All rights reserved.
//

import Foundation

class BookmarkPresenter {
  var controller : BookmarkViewController
  
  init(controller:BookmarkViewController) {
    self.controller = controller
  }
  
  func updateMoviesArray(array:Array<Movie>) {
    controller.updateMovieList(array: array)
  }
}
