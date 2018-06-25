//
//  NetworkProtocols.swift
//  Movies
//
//  Created by Ringa Sd on 21/06/2018.
//  Copyright © 2018 Mauricio Fonseca. All rights reserved.
//

import Foundation

protocol NetworkRequestProtocol {
  func requestMovieList(page: Int)
}
