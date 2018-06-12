//
//  BuyViewController.swift
//  Movies
//
//  Created by Ringa Sd on 08/06/2018.
//  Copyright © 2018 Mauricio Fonseca. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class BuyViewController: UIViewController {
  @IBOutlet var backbutton: UIButton!
  @IBOutlet var imageView: UIImageView!
  
  var currentMovie : Movie?
  
  //Changins statusBar text to light
  override var preferredStatusBarStyle: UIStatusBarStyle {
    return .lightContent
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setNeedsStatusBarAppearanceUpdate()
    
    let image = UIImage(named: "back")?.withRenderingMode(.alwaysTemplate)
    backbutton.setImage(image, for: .normal)
    backbutton.tintColor = UIColor.white
    
    Alamofire.request((currentMovie?.imageUrl)!).responseImage {
      response in
      if let image = response.result.value {
        self.imageView.image = image
      }
    }
  }
  
  @IBAction func goBack(_ sender: UIButton) {
    self.navigationController?.popViewController(animated: true)
  }
  
}
