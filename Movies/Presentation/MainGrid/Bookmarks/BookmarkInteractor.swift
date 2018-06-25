//
//  BookmarkInteractor.swift
//  Movies
//
//  Created by Ringa Sd on 11/06/2018.
//  Copyright © 2018 Mauricio Fonseca. All rights reserved.
//

import Foundation

class BookmarkInteractor: BookmarkInteractionProtocol {
  
  let diskOperator: DiskWorkerProtocol!
  
  init(diskOperator: DiskWorkerProtocol) {
    self.diskOperator = diskOperator
  }
  
  //MARK: Bookmark Interactor Protocol
  
  func loadBookmarks(presenter: MovieGridPresentationProtocol){
    print("requesting bookmarks")
    diskOperator.getBookmarkList(presenter: presenter)
  }
  
}
