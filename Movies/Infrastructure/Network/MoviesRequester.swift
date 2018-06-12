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
    if ReachabilityWorker.isConnectedToNetwork() { //Connected ok
      let url = "\(moviesUrl)&page=\(page)"
      Alamofire.request(url).validate().responseJSON {
        
        response in
        switch response.result {
        case .success:
          if response.result.value is NSNull { //Null response
            self.presenter.gotError(message:"Recebemos uma resposta vazia do servidor")
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
              movie.overview = movieDic["overview"] as! String
              responseArray.append(movie)
            }
          }
          //on API success
          self.presenter.updateMoviesArray(array:responseArray)
          
        case .failure(let error):
          self.presenter.gotError(message:error.localizedDescription)
        }
      }
    } else { //No connection
      print("Sem conexão à internet...")
      presenter.gotError(message:"Sem conexão à internet...")
    }
  }
}
