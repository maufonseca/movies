//
//  File.swift
//  Movies
//
//  Created by Ringa Sd on 08/06/2018.
//  Copyright © 2018 Mauricio Fonseca. All rights reserved.
//

import Foundation
import Alamofire

class MoviesRequester: NetworkRequestProtocol {
  let presenter: MovieGridPresentationProtocol
  
  init(presenter: MovieGridPresentationProtocol) {
    self.presenter = presenter
  }
  
  //Add language code to an url
  func localizeUrl(url: String) -> String {
    return "\(url)&language=\(NSLocalizedString("currentLanguage", comment: ""))"
  }
  
  func requestMovieList(page: Int) {
    if ReachabilityWorker.isConnectedToNetwork() { //Connection ok
      
      let url = "\(localizeUrl(url: moviesUrl))&page=\(page)"
      Alamofire.request(url).validate().responseJSON {
        
        response in
        switch response.result {
          
        case .success:
          if response.result.value is NSNull { //Null response treatment
            self.presenter.gotError(message:NSLocalizedString("emptyResponse", comment: ""))
            return
          }
          
          //Parsing the response dictionary
          let json = response.result.value as? NSDictionary
          let results = json?["results"] as! NSArray
          
          //Creating movies objects array and passing it to the presenter
          var responseArray: Array<Movie> = []
          for result in results {
            if let movieDic = result as? NSDictionary {
              //Ccnverting response to models
              responseArray.append(Movie.init(fromDictionary: movieDic))
            }
          }
          self.presenter.updateMoviesArray(array:responseArray)
          
        case .failure(let error): //Failure response treatment
          self.presenter.gotError(message:error.localizedDescription)
        }
      }
    } else { //No internet connection treatment
      print("Not connected to network...")
      presenter.gotError(message:NSLocalizedString("notConnected", comment: ""))
    }
  }
}
