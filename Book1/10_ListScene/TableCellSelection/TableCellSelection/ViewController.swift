//
//  ViewController.swift
//  TableCellSelection
//
//  Created by wannabewize on 2015. 3. 19..
//  Copyright (c) 2015년 wannabewize. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

  @IBOutlet weak var tableView: UITableView!
  var data : [String]!
  
  // 선택된 셀 데이터
  @IBAction func showSelectedCell(sender: AnyObject) {
    if let indexPathList = tableView.indexPathsForSelectedRows() {
      println("선택된 힝목")
      for item in indexPathList {
        let indexPath = item as! NSIndexPath
        println("\(data[indexPath.row])")
      }
    }
  }
  
  // 임의의 셀 선택
  @IBAction func selectRandomCell(sender: AnyObject) {
    let r = Int(arc4random_uniform( UInt32(data.count)) )
    let indexPath = NSIndexPath(forRow: r, inSection: 0)
    tableView.selectRowAtIndexPath(indexPath, animated: true, scrollPosition: UITableViewScrollPosition.Bottom)
  }
  
  // 선택된 셀 초기화
  @IBAction func clearSelection(sender: AnyObject) {
    if let indexPathList = tableView.indexPathsForSelectedRows() {
      for item in indexPathList {
        let indexPath = item as! NSIndexPath
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
      }
    }
  }
  
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
    
    // 여러개 선택 가능
    tableView.allowsMultipleSelection = true
    
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

