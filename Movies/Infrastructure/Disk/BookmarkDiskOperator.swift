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
  let presenter : BookmarkPresenter
  
  init(presenter:BookmarkPresenter) {
    self.presenter = presenter
  }
  
  func getBookmarkList() {
    // Query Realm for all bookmarks
    let bookmarks = realm.objects(Movie.self)
    print("Realm bookmarks count: \(bookmarks.count)")
  }
  
  func addBookmark(movie:Movie) {
    // Save bookmark
    try! realm.write {
      realm.add(movie)
    }
  }
  
  func removeBookmark(movie:Movie) {
    // Remove bookmark
    let theMovie = realm.objects(Movie.self).filter("id == \(movie.id)").first
    try! realm.write {
      realm.delete(theMovie!)
    }
  }
  
  func findBookmark(movie:Movie) -> Bool {
    // Find bookmark
    let bookmarks = realm.objects(Movie.self).filter("id == \(movie.id)")
    print("Realm bookmarks matches: \(bookmarks.count)")
    return bookmarks.count > 0 ? true:false
  }


}
