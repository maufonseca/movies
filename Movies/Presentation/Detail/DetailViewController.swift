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
  @IBOutlet var favoriteButton: UIButton!
  @IBOutlet var imageView: UIImageView!
  @IBOutlet var titleLabel: UILabel!
  @IBOutlet var descriptionLabel: UILabel!
  
  var currentMovie : Movie?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    titleLabel.text = currentMovie?.title
    descriptionLabel.text = currentMovie?.description
    Alamofire.request((currentMovie?.imageUrl)!).responseImage {
      
      response in
      if let image = response.result.value {
        self.imageView.image = image
      }
    }
  }

  @IBAction func favoriteTapped(_ sender: UIButton) {
  }
  
  @IBAction func goBack(_ sender: UIButton) {
    self.navigationController?.popViewController(animated: true)
  }
  

}
