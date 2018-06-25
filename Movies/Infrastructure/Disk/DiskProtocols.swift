//
//  DiskProtocols.swift
//  Movies
//
//  Created by Ringa Sd on 21/06/2018.
//  Copyright © 2018 Mauricio Fonseca. All rights reserved.
//

import Foundation

protocol DiskWorkerProtocol {
  func getBookmarkList(presenter: MovieGridPresentationProtocol)
  func addBookmark(bookmark: Movie)
  func removeBookmark(id: Int)
  func isBookmarked(id: Int) -> Bool
}
