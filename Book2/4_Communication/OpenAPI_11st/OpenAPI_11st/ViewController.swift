//
//  ViewController.swift
//  OpenAPI_11st
//
//  Created by wannabewize on 2015. 2. 11..
//  Copyright (c) 2015년 VanillaStep. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UISearchBarDelegate {
  
  @IBOutlet weak var tableView: UITableView!
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return Model.sharedModel.numberOfProduct()
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("ProductCell", forIndexPath: indexPath) as! UITableViewCell
    
    let product = Model.sharedModel.productAt(indexPath.row)
    cell.textLabel?.text = product.name
    
    if let imageUrl = product.image {
      let url = NSURL(string: imageUrl)!
      if let data = NSData(contentsOfURL: url) {
        let image = UIImage(data: data)
        cell.imageView?.image = image
      }
    }
    
    return cell;
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    let indexPath = tableView.indexPathForCell(sender as! UITableViewCell)!
    let product = Model.sharedModel.productAt(indexPath.row)
    
    let detailVC = segue.destinationViewController as! DetailViewController
    detailVC.productCode = product.code
    detailVC.title = product.name
  }
  
  func searchBarSearchButtonClicked(searchBar: UISearchBar) {
    let keyword = searchBar.text
    Model.sharedModel.searchProduct(keyword)
  }
  
  func handleSearchResult(noti : NSNotification) {
    self.tableView.reloadData()
  }
  
  override func viewWillAppear(animated: Bool) {
    NSNotificationCenter.defaultCenter().addObserver(self, selector: "handleSearchResult:", name: SearchProductFinishNotification, object: nil)
    Model.sharedModel.searchProduct("iMac")
  }
  
  override func viewDidDisappear(animated: Bool) {
    NSNotificationCenter.defaultCenter().removeObserver(self)
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

