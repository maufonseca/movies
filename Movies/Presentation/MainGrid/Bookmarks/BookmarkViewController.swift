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

class BookmarkViewController: CollectionViewController {

  @IBOutlet var bookmarksCollectionView: UICollectionView!
  var presenter: MovieGridPresentationProtocol!
  var diskOperator: DiskWorkerProtocol!
  var interactor: BookmarkInteractionProtocol!
  
  override func viewDidLoad() {
    collectionView = bookmarksCollectionView
    super.viewDidLoad()
    
    presenter = BookmarkPresenter.init(controller: self)
    diskOperator = BookmarkDiskOperator.init()
    interactor = BookmarkInteractor.init(diskOperator: diskOperator)
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    interactor.loadBookmarks(presenter: presenter)
  }
  
}

