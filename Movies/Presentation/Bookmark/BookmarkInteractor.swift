//
//  HomeInteractor.swift
//  Movies
//
//  Created by Ringa Sd on 11/06/2018.
//  Copyright © 2018 Mauricio Fonseca. All rights reserved.
//

import Foundation
class BookmarkInteractor {
  
  let diskOperator : BookmarkDiskOperator?
  
  init(diskOperator:BookmarkDiskOperator) {
    self.diskOperator = diskOperator
  }
  
  func loadBookmarks() {
    print("requesting bookmarks")
    diskOperator?.getBookmarkList()
  }
  
  func addBookmark() {
    
  }
  
  func removeBookmark() {
  
  }
}
