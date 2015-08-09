//
//  Product.swift
//  TableCatalog
//
//  Created by wannabewize on 2015. 3. 19..
//  Copyright (c) 2015년 wannabewize. All rights reserved.
//

import Foundation

class Product {
  var code : String!
  var name : String!
  var price : String!
  var image : String!
  
  
  // Designated Initalizer
  init(code : String, name : String, price : String, image : String) {
    self.code = code
    self.name = name
    self.price = price
    self.image = image
  }
}