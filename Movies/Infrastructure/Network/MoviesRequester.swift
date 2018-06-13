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
              //Ccnverting response to models
              responseArray.append(Movie.init(fromDictionary: movieDic))
            }
          }
          //Inform the presenter about API success
          self.presenter.updateMoviesArray(array:responseArray)
          
        case .failure(let error):
          //Inform the presenter about API fail
          self.presenter.gotError(message:error.localizedDescription)
        }
      }
    } else { //No internet connection
      print("Sem conexão à internet...")
      presenter.gotError(message:"Sem conexão à internet...")
    }
  }
}
