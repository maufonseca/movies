//
//  SearchPresenter.swift
//  Movies
//
//  Created by Ringa Sd on 08/06/2018.
//  Copyright © 2018 Mauricio Fonseca. All rights reserved.
//

import Foundation

class HomePresenter {
  var controller : HomeViewController

  init(controller:HomeViewController) {
    self.controller = controller
  }
  
  func updateMoviesArray(array:Array<Movie>) {
    controller.updateMovieList(array: array)
  }
  
  func gotError(message:String) {
    controller.showMessage(message:message)
    controller.pauseInfiniteScroll()
  }
}
