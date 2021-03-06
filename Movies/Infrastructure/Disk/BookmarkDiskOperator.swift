//
//  DiskOperator.swift
//  Movies
//
//  Created by Ringa Sd on 11/06/2018.
//  Copyright © 2018 Mauricio Fonseca. All rights reserved.
//

import Foundation
import RealmSwift

class BookmarkDiskOperator: DiskWorkerProtocol {
  
  let realm = try! Realm()
  
  func getBookmarkList(presenter: MovieGridPresentationProtocol) {
    // Query Realm for all bookmarks
    var responseArray: Array<Movie> = []
    let bookmarks = realm.objects(Movie.self)
    print("Realm bookmarks count: \(bookmarks.count)")
    
    for bookmark in bookmarks {
      print("MovieFound", bookmark.title)
      let movie = Movie(value: bookmark) //creating a non persistent copy of object
      responseArray.append(movie)
    }
    
    presenter.updateMoviesArray(array: responseArray)
  }
  
  func addBookmark(bookmark: Movie) {
    // Save bookmark
    let movie = Movie(value:bookmark) //creating a copy for persistence
    try! realm.write {
      movie.bookmarked = true
      realm.add(movie)
    }
  }
  
  func removeBookmark(id: Int) {
    // Remove bookmark by ID
    let theMovie = realm.objects(Movie.self).filter("id == \(id)").first
    try! realm.write {
      realm.delete(theMovie!)
    }
  }
  
  func isBookmarked(id: Int) -> Bool {
    // Find bookmark by ID
    let bookmarks = realm.objects(Movie.self).filter("id == \(id)")
    print("Realm bookmarks matches: \(bookmarks.count)")
    return bookmarks.count > 0 ? true:false
  }
}
