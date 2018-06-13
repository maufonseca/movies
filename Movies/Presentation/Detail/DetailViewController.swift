//
//  DetailViewController.swift
//  Movies
//
//  Created by Ringa Sd on 08/06/2018.
//  Copyright © 2018 Mauricio Fonseca. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class DetailViewController: UIViewController {
  @IBOutlet var bookmarkButton: UIButton!
  @IBOutlet var imageView: UIImageView!
  @IBOutlet var titleLabel: UILabel!
  @IBOutlet var descriptionLabel: UILabel!
  @IBOutlet var yearLabel: UILabel!
  
  var currentMovie : Movie?
  var diskOperator = BookmarkDiskOperator.init()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    titleLabel.text = currentMovie?.title
    descriptionLabel.text = currentMovie?.overview
    yearLabel.text = currentMovie?.getReleaseYear()
    Alamofire.request((currentMovie?.imageUrl)!).responseImage {
      response in
      if let image = response.result.value {
        self.imageView.image = image
      }
    }
    //check bookmarked
    if(diskOperator.isBookmarked(id: currentMovie!.id)) { //already added
      currentMovie?.bookmarked = true
      setupRemoveBookmarkButton()
    } else { //add to bookmark setup
      currentMovie?.bookmarked = false
      setupAddBookmarkButton()
    }
  }

  func setupAddBookmarkButton() {
    bookmarkButton.setTitle(NSLocalizedString("addBookmark", comment: ""), for: .normal)
    bookmarkButton.setImage(Image(named: "bookmarks"), for: .normal)
  }
  func setupRemoveBookmarkButton() {
    bookmarkButton.setTitle(NSLocalizedString("removeBookmark", comment: ""), for: .normal)
    bookmarkButton.setImage(Image(named: "star_filled"), for: .normal)
  }
  
  @IBAction func bookmarkTapped(_ sender: UIButton) {
    if(currentMovie?.bookmarked)! {
      removeBookmark()
    } else {
      addBookmark()
    }
  }
  
  func removeBookmark() {
    diskOperator.removeBookmark(id: currentMovie!.id)
    currentMovie?.bookmarked = false
    setupAddBookmarkButton()
  }
  
  func addBookmark() {
    currentMovie?.bookmarked = true
    diskOperator.addBookmark(bookmark: currentMovie!)
    setupRemoveBookmarkButton()
  }
  
  @IBAction func goBack(_ sender: UIButton) {
    self.navigationController?.popViewController(animated: true)
  }
  
  
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if(segue.identifier == "buySegue") {
      let vc = segue.destination as! BuyViewController
      vc.currentMovie = self.currentMovie
    }
  }

}
