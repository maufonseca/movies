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
  let presenter : HomePresenter
  
  init(presenter:HomePresenter) {
    self.presenter = presenter
  }
  
  func requestMovieList(page : Int) {
    let url = "\(moviesUrl)&page=\(page)"
    Alamofire.request(url).responseJSON { response in
      
      if response.result.value is NSNull {
        //presenter.onError("Erro ao carregar filmes")
        return
      }
      var responseArray : Array<Movie> = []
      
      let json = response.result.value as? NSDictionary
      let results = json?["results"] as! NSArray
      for result in results {
        if let movieDic = result as? NSDictionary {
          //Parsing response to models
          let movie = Movie.init()
          movie.id = movieDic["id"] as! Int
          movie.title = movieDic["title"] as! String
          movie.releaseDate = movieDic["release_date"] as! String
          movie.imageUrl = "\(imagesUrl)\(movieDic["poster_path"] ?? "")"
          movie.description = movieDic["overview"] as! String
          responseArray.append(movie)
        }
      }
      //on API success
      self.presenter.updateMoviesArray(array:responseArray)
    }
  }
}
