//
//  FirstViewController.swift
//  Movies
//
//  Created by Ringa Sd on 08/06/2018.
//  Copyright © 2018 Mauricio Fonseca. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class HomeViewController: CollectionViewController, InfiniteScrollDisplayProtocol {
  
  @IBOutlet var movieCollectionView: UICollectionView!
  
  var presenter : MovieGridPresentationProtocol?
  var requester : NetworkRequestProtocol?
  var interactor : InfiniteScrollInteractionProtocol?
  
  override func viewDidLoad() {
    self.collectionView = movieCollectionView
    super.viewDidLoad()
    
    //setup scene
    presenter = HomePresenter.init(controller: self)
    requester = MoviesRequester.init(presenter: presenter!)
    interactor = HomeInteractor.init(requester: requester!)
    
    interactor?.requestNextPage()
  }

  //Getting scroll position to load more results (infinite scroll)
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    for cell in self.movieCollectionView.visibleCells {
      let indexPath = self.movieCollectionView.indexPath(for: cell)
      if((indexPath?.row)! == 20*(interactor?.getCurrentPage())!-5) {
        interactor?.requestNextPage()
      }
    }
  }
  
  //MARK: Grid Display Protocol
  
  override func updateMovieList(array:Array<Movie>) {
    self.movies += array
    self.movieCollectionView.reloadData()
  }
  
  //MARK: Infinite Scroll Display Protocol
  
  func pauseInfiniteScroll() { //in case of error, decrease the page count because call failed
    interactor?.decreasePage()
  }
  
}

