//
//  FirstViewController.swift
//  Movies
//
//  Created by Ringa Sd on 08/06/2018.
//  Copyright © 2018 Mauricio Fonseca. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  
  
  @IBOutlet var movieCollectionView: UICollectionView!
  
  var presenter : SearchPresenter?
  var requester : MoviesRequester?
  var interactor : SearchInteractor?
  var movies : Array<Movie> = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    movieCollectionView.register(UINib.init(nibName: "MovieCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "movieCell")
    
    presenter = SearchPresenter.init(controller: self)
    requester = MoviesRequester.init(presenter: presenter!)
    interactor = SearchInteractor.init(requester: requester!)
    interactor!.getResults(query: "a")
    
  }

  // COLLECTIONVIEW SOURCE
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return movies.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
  
    let currentMovie = movies[indexPath.row]
    
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "movieCell", for: indexPath) as! MovieCollectionViewCell
    
    cell.titleLabel.text = currentMovie.title
    cell.yearLabel.text = currentMovie.year
    
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let width = collectionView.frame.size.width/3-12
    return CGSize(width: width, height: width*16/9)
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    performSegue(withIdentifier: "detailSegue", sender: movies[indexPath.row])
  }
  
  func updateMovieList(array:Array<Movie>) {
    self.movies = array
    self.movieCollectionView.reloadData()
  }
  
}

