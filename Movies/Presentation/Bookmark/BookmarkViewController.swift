//
//  SecondViewController.swift
//  Movies
//
//  Created by Ringa Sd on 08/06/2018.
//  Copyright © 2018 Mauricio Fonseca. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class BookmarkViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{

  @IBOutlet var bookmarksCollectionView: UICollectionView!
  var presenter : BookmarkPresenter?
  var diskOperator : BookmarkDiskOperator?
  var interactor : BookmarkInteractor?
  var movies : Array<Movie> = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    bookmarksCollectionView.register(UINib.init(nibName: "MovieCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "movieCell")
    
    presenter = BookmarkPresenter.init(controller: self)
    diskOperator = BookmarkDiskOperator.init()
    interactor = BookmarkInteractor.init(diskOperator: diskOperator!)
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    interactor?.loadBookmarks(presenter: presenter!)
  }
  
  func updateMovieList(array:Array<Movie>) {
    self.movies = array
    self.bookmarksCollectionView.reloadData()
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if(segue.identifier == "detailSegue") {
      let tappedMovie = sender as! Movie
      let vc = segue.destination as! DetailViewController
      vc.currentMovie = tappedMovie
    }
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
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let width = collectionView.frame.size.width/3-12
    return CGSize(width: width, height: width*16/9)
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    performSegue(withIdentifier: "detailSegue", sender: movies[indexPath.row])
  }
  
}

