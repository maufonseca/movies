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
  
  func getBookmarkList() {
    // Query Realm for all bookmarks
    let bookmarks = realm.objects(Movie.self)
    print("Realm bookmarks count: \(bookmarks.count)")
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
