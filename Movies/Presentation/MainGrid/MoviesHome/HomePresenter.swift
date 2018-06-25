//
//  SearchPresenter.swift
//  Movies
//
//  Created by Ringa Sd on 08/06/2018.
//  Copyright © 2018 Mauricio Fonseca. All rights reserved.
//

import Foundation

class HomePresenter : MovieGridPresentationProtocol {

  //weak var to break possible retain cycles
  weak var controller : InfiniteScrollDisplayProtocol?

  init(controller:InfiniteScrollDisplayProtocol) {
    self.controller = controller
  }
  
  //MARK: Presentation protocol
  
  func updateMoviesArray(array:Array<Movie>) {
    controller?.updateMovieList(array: array)
  }
  
  func gotError(message:String) {
    controller?.showMessage(message:message)
    controller?.pauseInfiniteScroll()
  }
}
