//
//  CustomTableViewController.swift
//  StaticCell
//
//  Created by wannabewize on 10/18/15.
//  Copyright © 2015 wannabewize. All rights reserved.
//

import UIKit

class CustomTableViewController: UITableViewController {
   
   @IBOutlet weak var cellLabel: UILabel!
   
   @IBAction func cellSlider(sender: AnyObject) {
      let slider = sender as! UISlider
      print("slider changed \(slider.value)")
   }
   
   override func viewDidAppear(animated: Bool) {
      cellLabel.text = "정적 테이블 뷰 셀"
   }
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      // Uncomment the following line to preserve selection between presentations
      // self.clearsSelectionOnViewWillAppear = false
      
      // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
      // self.navigationItem.rightBarButtonItem = self.editButtonItem()
   }
   
   override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
   }
}
