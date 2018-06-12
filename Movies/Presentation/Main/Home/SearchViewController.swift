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

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  
  
  @IBOutlet var movieCollectionView: UICollectionView!
  
  var presenter : SearchPresenter?
  var requester : MoviesRequester?
  var interactor : SearchInteractor?
  var movies : Array<Movie> = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    movieCollectionView.register(UINib.init(nibName: "MovieCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "movieCell")
  
    movieCollectionView.register(UINib.init(nibName: "HeaderCell", bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "headerView")
    
    presenter = SearchPresenter.init(controller: self)
    requester = MoviesRequester.init(presenter: presenter!)
    interactor = SearchInteractor.init(requester: requester!)
    interactor?.getNextPage()
    
  }

  // COLLECTIONVIEW SOURCE
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return movies.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
  
    let currentMovie = movies[indexPath.row]
    
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "movieCell", for: indexPath) as! MovieCollectionViewCell
    
    cell.titleLabel.text = currentMovie.title
    cell.yearLabel.text = currentMovie.getReleaseYear()
    
    Alamofire.request(currentMovie.imageUrl).responseImage {
      
      response in
      if let image = response.result.value {
        cell.imageView.image = image
      }
    }
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "headerView", for: indexPath)
    headerView.frame.size.height = 100
    return headerView
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
    return CGSize(width: collectionView.frame.width, height: 100)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let width = collectionView.frame.size.width/3-12
    return CGSize(width: width, height: width*16/9)
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    performSegue(withIdentifier: "detailSegue", sender: movies[indexPath.row])
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
  
  func updateMovieList(array:Array<Movie>) {
    self.movies += array
    self.movieCollectionView.reloadData()
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if(segue.identifier == "detailSegue") {
      let tappedMovie = sender as! Movie
      let vc = segue.destination as! DetailViewController
      vc.currentMovie = tappedMovie
    }
  }
  
}

