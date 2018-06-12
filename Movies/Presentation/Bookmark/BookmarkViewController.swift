//
//  SecondViewController.swift
//  Movies
//
//  Created by Ringa Sd on 08/06/2018.
//  Copyright © 2018 Mauricio Fonseca. All rights reserved.
//

import UIKit

class BookmarkViewController: UIViewController {

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
    interactor?.loadBookmarks()
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
}

