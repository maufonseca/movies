//
//  Movie.swift
//  Movies
//
//  Created by Ringa Sd on 08/06/2018.
//  Copyright © 2018 Mauricio Fonseca. All rights reserved.
//

import Foundation
import RealmSwift

class Movie : Object {
  @objc dynamic var id : Int = -1
  @objc dynamic var title : String = ""
  @objc dynamic var overview : String = ""
  @objc dynamic var imageUrl : String = ""
  @objc dynamic var releaseDate : String = ""
  @objc dynamic var bookmarked : Bool = false
  
  convenience init(fromDictionary movieDic: NSDictionary) {
    self.init()
    id = movieDic["id"] as! Int
    title = movieDic["title"] as! String
    releaseDate = movieDic["release_date"] as! String
    imageUrl = "\(imagesUrl)\(movieDic["poster_path"] ?? "")"
    overview = movieDic["overview"] as! String
  }
  
  func getReleaseYear() -> String {
    return String(releaseDate.prefix(4))
  }
  
}
