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
    // 반환값이 옵셔널이 아니다.
    let cell = tableView.dequeueReusableCellWithIdentifier("CELL_ID", forIndexPath: indexPath)
    // 옵셔널 반환이므로 강제 언래핑
//    let cell = tableView.dequeueReusableCellWithIdentifier("CELL_ID")!
   
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

