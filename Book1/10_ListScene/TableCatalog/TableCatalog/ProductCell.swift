//
//  ProductCell.swift
//  TableCatalog
//
//  Created by wannabewize on 2015. 3. 19..
//  Copyright (c) 2015년 wannabewize. All rights reserved.
//

import UIKit

protocol ProductCellDelegate : class {
  func addCart(productCode : String)
}

class ProductCell: UITableViewCell {
  
  weak var delegate : ProductCellDelegate!
  
  @IBAction func addButtonClicked(sender: AnyObject) {
    delegate.addCart(productCode)
  }
  
  var productCode : String!
  
  @IBOutlet weak var productImage: UIImageView!
  @IBOutlet weak var productName: UILabel!
  @IBOutlet weak var productPrice: UILabel!
}
