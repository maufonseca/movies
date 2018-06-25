//
//  SearchMovieInteractor.swift
//  Movies
//
//  Created by Ringa Sd on 08/06/2018.
//  Copyright © 2018 Mauricio Fonseca. All rights reserved.
//

import Foundation

class HomeInteractor: InfiniteScrollInteractionProtocol {
  var currentPage: Int = 0
  let requester: NetworkRequestProtocol!
  
  init(requester: NetworkRequestProtocol) {
    self.requester = requester
  }
  
  //MARK: InfiniteScroll protocol
  
  func requestCurrentPage() {
    print("requesting page: \(currentPage)")
    requester.requestMovieList(page: currentPage)
  }
  
  func requestNextPage() {
    currentPage += 1
    requestCurrentPage()
  }
  
  func requestPreviousPage() {
    if(currentPage > 1) {
      currentPage -= 1
      requestCurrentPage()
    }
  }
  
  func decreasePage() {
    currentPage -= 1
  }
  
  func getCurrentPage() -> Int {
    return currentPage
  }
}
