//
//  ViewController.swift
//  TableViewStyle
//
//  Created by wannabewize on 2015. 5. 14..
//  Copyright (c) 2015년 wannabewize. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  
  func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    
  }
  
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 4
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 5
  }
  
  func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return "Header \(section)"
  }
  
  func sectionIndexTitlesForTableView(tableView: UITableView) -> [String]? {
    return ["1", "2", "3", "4"]
  }
  
  func tableView(tableView: UITableView, sectionForSectionIndexTitle title: String, atIndex index: Int) -> Int {
    return index
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cellId : String = "CELL\(indexPath.section)"
    let cell = tableView.dequeueReusableCellWithIdentifier(cellId, forIndexPath: indexPath) 
    cell.textLabel?.text = "Item \(indexPath.row)"
    
    print("cell.backgroundView : \(cell.backgroundView), cell.backgroundColor : \(cell.backgroundColor)")
    cell.backgroundColor = UIColor.redColor()
    return cell
    
  }
  


  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

