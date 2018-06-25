//
//  BookmarkPresenter.swift
//  Movies
//
//  Created by Ringa Sd on 11/06/2018.
//  Copyright © 2018 Mauricio Fonseca. All rights reserved.
//

import Foundation

class BookmarkPresenter: MovieGridPresentationProtocol {
  
  //weak var to break possible retain cycles
  weak var gridController: MovieGridDisplayProtocol!
  
  init(controller: MovieGridDisplayProtocol) {
    self.gridController = controller
  }
  
  //MARK: Presentation protocol
  
  func updateMoviesArray(array: Array<Movie>) {
    gridController.updateMovieList(array: array)
  }
  
  func gotError(message: String) {
    gridController.showMessage(message:message)
  }
}
