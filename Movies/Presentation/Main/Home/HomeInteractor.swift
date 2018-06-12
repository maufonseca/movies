//
//  SearchMovieInteractor.swift
//  Movies
//
//  Created by Ringa Sd on 08/06/2018.
//  Copyright © 2018 Mauricio Fonseca. All rights reserved.
//

import Foundation

class HomeInteractor {
  var currentPage : Int = 0
  let requester : MoviesRequester?
  
  init(requester:MoviesRequester) {
    self.requester = requester
  }
  
  func requestCurrentPage() {
    print("requesting page: \(currentPage)")
    requester?.requestMovieList(page: currentPage)
  }
  
  func getNextPage() {
    if(ReachabilityWorker.isConnectedToNetwork()) { //only increase page if connected
      currentPage+=1
    }
    requestCurrentPage()
  }
  
  func getPreviousPage() {
    if(currentPage>1) {
      currentPage -= 1
      requestCurrentPage()
    }
  }
  
  func decreasePage() {
    currentPage -= 1
  }
}
