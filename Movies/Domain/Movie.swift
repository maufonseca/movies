//
//  Movie.swift
//  Movies
//
//  Created by Ringa Sd on 08/06/2018.
//  Copyright © 2018 Mauricio Fonseca. All rights reserved.
//

import Foundation

class Movie {
  var id : Int = -1
  var title : String = ""
  var description : String = ""
  var imageUrl : String = ""
  var releaseDate : String = ""
  var bookmarked : Bool = false
  
  func getReleaseYear() -> String {
    return String(releaseDate.prefix(4))
  }
}
