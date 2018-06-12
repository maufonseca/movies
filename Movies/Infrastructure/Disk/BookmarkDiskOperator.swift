//
//  DiskOperator.swift
//  Movies
//
//  Created by Ringa Sd on 11/06/2018.
//  Copyright © 2018 Mauricio Fonseca. All rights reserved.
//

import Foundation
import RealmSwift

class BookmarkDiskOperator {
  
  let realm = try! Realm()
  
  init() {
  }
  
  func getBookmarkList(presenter : BookmarkPresenter) {
    // Query Realm for all bookmarks
    var responseArray : Array<Movie> = []
    let bookmarks = realm.objects(Movie.self)
    print("Realm bookmarks count: \(bookmarks.count)")
    
    for bookmark in bookmarks {
      print("MovieFound", bookmark.title)
      let movie = Movie.init()
      movie.id = bookmark.id
      movie.title = bookmark.title
      movie.releaseDate = bookmark.releaseDate
      movie.bookmarked = bookmark.bookmarked
      movie.imageUrl = bookmark.imageUrl
      movie.overview = bookmark.overview
      responseArray.append(movie)
    }
    
    presenter.updateMoviesArray(array: responseArray)
  }
  
  func addBookmark(movie:Movie) {
    // Save bookmark
    try! realm.write {
      movie.bookmarked = true
      realm.add(movie)
    }
  }
  
  func removeBookmark(movie:Movie) {
    // Remove bookmark by ID
    let theMovie = realm.objects(Movie.self).filter("id == \(movie.id)").first
    try! realm.write {
      realm.delete(theMovie!)
    }
  }
  
  func isBookmarked(movie:Movie) -> Bool {
    // Find bookmark by ID
    let bookmarks = realm.objects(Movie.self).filter("id == \(movie.id)")
    print("Realm bookmarks matches: \(bookmarks.count)")
    return bookmarks.count > 0 ? true:false
  }


}
