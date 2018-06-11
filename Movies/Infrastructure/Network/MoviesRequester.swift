//
//  File.swift
//  Movies
//
//  Created by Ringa Sd on 08/06/2018.
//  Copyright © 2018 Mauricio Fonseca. All rights reserved.
//

import Foundation
import Alamofire

class MoviesRequester {
  let presenter : SearchPresenter
  
  init(presenter:SearchPresenter) {
    self.presenter = presenter
  }
  
  func requestMovieList(query : String) {
    Alamofire.request(moviesUrl).responseJSON { response in
      
      if response.result.value is NSNull {
        //presenter.onError("Erro ao carregar filmes")
        return
      }
      var responseArray : Array<Movie> = []
      
      let json = response.result.value as? NSDictionary
      let results = json?["results"] as! NSArray
      for result in results {
        if let movieDic = result as? NSDictionary {
          let movie = Movie.init()
          movie.title = movieDic["title"] as! String
          movie.year = movieDic["release_date"] as! String
          movie.imageUrl = "\(imagesUrl)\(movieDic["poster_path"] ?? "")"
          responseArray.append(movie)
        }
      }
      //on API success
      self.presenter.updateMoviesArray(array:responseArray)
    }
  }
}
