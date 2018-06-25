//
//  MoviesProtocols.swift
//  Movies
//
//  Created by Ringa Sd on 21/06/2018.
//  Copyright © 2018 Mauricio Fonseca. All rights reserved.
//

import Foundation

//Rules for presenting a movie collection grid
protocol MovieGridPresentationProtocol {
  func updateMoviesArray(array:Array<Movie>)
  func gotError(message:String)
}

//Rules for displaying a movie collection grid
protocol MovieGridDisplayProtocol : class {
  func updateMovieList(array:Array<Movie>)
  func showMessage(message: String)
}

//Rules for interacting with bookmarks
protocol BookmarkInteractionProtocol {
  func loadBookmarks(presenter: MovieGridPresentationProtocol)
}

//Rules for interacting with an Infinite Scroll
protocol InfiniteScrollInteractionProtocol {
  func requestCurrentPage()
  func requestNextPage()
  func requestPreviousPage()
  func decreasePage()
  func getCurrentPage() -> Int
}

//Rules for displaying an infinite scroll (its a movie grid display either)
protocol InfiniteScrollDisplayProtocol: MovieGridDisplayProtocol {
  func pauseInfiniteScroll()
}
