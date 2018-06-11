//
//  BuyViewController.swift
//  Movies
//
//  Created by Ringa Sd on 08/06/2018.
//  Copyright © 2018 Mauricio Fonseca. All rights reserved.
//

import UIKit

class BuyViewController: UIViewController {
  override func viewDidLoad() {
      super.viewDidLoad()

  }
  
  @IBAction func goBack(_ sender: UIButton) {
    self.navigationController?.popViewController(animated: true)
  }
  
}
