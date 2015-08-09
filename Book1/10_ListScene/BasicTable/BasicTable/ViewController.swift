//
//  ViewController.swift
//  BasicTable
//
//  Created by wannabewize on 2015. 3. 19..
//  Copyright (c) 2015년 wannabewize. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
  var data : [String]!
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return data.count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("CELL_ID") as! UITableViewCell
    let itemName = data[indexPath.row]
    cell.textLabel?.text = itemName
    let image = UIImage(named: "\(itemName).png")
    cell.imageView?.image = image
    return cell
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    data = ["Baseball",
          "Basketball",
          "Football",
          "Golf",
          "Rugby",
          "Shuttlecock",
          "Tennis",
          "Volleyball",
          "TableTennis",
          "IceHockey",
          "Billiard"]
  }
}

