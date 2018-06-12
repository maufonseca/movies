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

class HomeViewController: CollectionViewController {
  
  
  @IBOutlet var movieCollectionView: UICollectionView!
  
  var presenter : HomePresenter?
  var requester : MoviesRequester?
  var interactor : HomeInteractor?
  
  override func viewDidLoad() {
    self.collectionView = movieCollectionView
    super.viewDidLoad()
    
    presenter = HomePresenter.init(controller: self)
    requester = MoviesRequester.init(presenter: presenter!)
    interactor = HomeInteractor.init(requester: requester!)
    
    interactor?.getNextPage()
    
  }

  //Getting scroll position to load more results (infinite scroll)
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    for cell in self.movieCollectionView.visibleCells {
      let indexPath = self.movieCollectionView.indexPath(for: cell)
      if((indexPath?.row)! == 20*(interactor?.currentPage)!-5) {
        interactor?.getNextPage()
      }
    }
  }
  
  override func updateMovieList(array:Array<Movie>) {
    self.movies += array
    self.movieCollectionView.reloadData()
  }
  
}

