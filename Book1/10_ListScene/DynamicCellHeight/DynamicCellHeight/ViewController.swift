//
//  ViewController.swift
//  DynamicCellHeight
//
//  Created by Jaehoon Lee on 2016. 9. 22..
//  Copyright © 2016년 Jaehoon Lee. All rights reserved.
//

import UIKit

class MyCell : UITableViewCell {
   @IBOutlet var label : UILabel!
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
   
   @IBOutlet var tableView : UITableView!
   var data = [String]()
   
   func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return data.count
   }
   
   func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCellWithIdentifier("CELL_ID", forIndexPath: indexPath) as! MyCell
      
      cell.label.text = data[indexPath.row]
      
      return cell
   }

   override func viewDidLoad() {
      super.viewDidLoad()
      
      tableView.estimatedRowHeight = 44
      tableView.rowHeight = UITableViewAutomaticDimension
      
      
      data.append("abcdefghjklmnopqrstuvwxyz")
      data.append("abcdefghjklmnopqrstuvwxyzabcdefghjklmnopqrstuvwxyz")
      data.append("abcdefghjklmnopqrstuvwxyzabcdefghjklmnopqrstuvwxyz\nabcdefghjklmnopqrstuvwxyz")

      data.append("abcdefghjklmnopqrstuvwxyz\nabcdefghjklmnopqrstuvwxyz\nabcdefghjklmnopqrstuvwxyz\nabcdefghjklmnopqrstuvwxyz")
      data.append("abcdefghjklmnopqrstuvwxyz\nabcdefghjklmnopqrstuvwxyz\nabcdefghjklmnopqrstuvwxyz")
   }
}

