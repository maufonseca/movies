//
//  CollectionViewController.swift
//  Movies
//
//  Created by Ringa Sd on 12/06/2018.
//  Copyright © 2018 Mauricio Fonseca. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage
import MaterialComponents.MaterialSnackbar

class CollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, MovieGridDisplayProtocol {

  var collectionView: UICollectionView!
  var movies: Array<Movie> = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    collectionView.register(UINib.init(nibName: "MovieCollectionViewCell", bundle: nil), forCellWithReuseIdentifier:  "movieCell")
  }
  
  //MARK: Grid Display Protocol
  
  func showMessage(message: String){
    let snackMessage = MDCSnackbarMessage()
    snackMessage.text = message
    MDCSnackbarManager.show(snackMessage)
  }
  
  func updateMovieList(array:Array<Movie>) {
    self.movies = array
    self.collectionView.reloadData()
  }
  
  //MARK: COLLECTIONVIEW SOURCE
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return movies.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    let currentMovie = movies[indexPath.row]
    
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "movieCell", for: indexPath) as! MovieCollectionViewCell
    
    cell.titleLabel.text = currentMovie.title
    cell.yearLabel.text = currentMovie.getReleaseYear()
    cell.imageView.image = nil
    
    Alamofire.request(currentMovie.imageUrl).responseImage {
      
      response in
      if let image = response.result.value {
        cell.imageView.image = image
      }
    }
    return cell
  }
  
  func getCellSizeForPortrait(collectionViewWidth:CGFloat) -> CGSize{
    let width = collectionView.frame.size.width/3-12
    return CGSize(width: width, height: width*16/9)
  }
  
  func getCellSizeForLandscape(collectionViewWidth:CGFloat) -> CGSize{
    let width = collectionView.frame.size.width/5-20
    return CGSize(width: width, height: width*16/9)
  }
  
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    //Depending on device orientation, we will build the collection view
    if (UIDevice.current.orientation == .landscapeLeft) || (UIDevice.current.orientation == .landscapeRight) {
      return getCellSizeForLandscape(collectionViewWidth: collectionView.frame.size.width)
    } else {
      return getCellSizeForPortrait(collectionViewWidth: collectionView.frame.size.width)
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    performSegue(withIdentifier: "detailSegue", sender: movies[indexPath.row])
  }
  
  //MARK: Navigation
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if(segue.identifier == "detailSegue") {
      let tappedMovie = sender as! Movie
      let vc = segue.destination as! DetailViewController
      vc.currentMovie = tappedMovie
    }
  }
  
}
