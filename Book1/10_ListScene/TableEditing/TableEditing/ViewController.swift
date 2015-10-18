//
//  ViewController.swift
//  TableEditing
//
//  Created by wannabewize on 2015. 3. 19..
//  Copyright (c) 2015년 wannabewize. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

  @IBOutlet weak var tableView: UITableView!
  
  var data = ["1","2","3","4","5"]
  
  @IBAction func editList(sender: AnyObject) {
    tableView.editing = !tableView.editing
  }
  
  func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
    // 난수로 셀 편집 스타일 설정
    let r = Int(arc4random_uniform(3))
    return UITableViewCellEditingStyle(rawValue: r)!
  }
  
  func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    
    if UITableViewCellEditingStyle.Delete == editingStyle {
      // 선택한 데이터와 셀 삭제
      data.removeAtIndex(indexPath.row)
      tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
    }
    else {
      // 새로운 데이터 추가
      let dialog = UIAlertController(title: "추가하기", message: "새로운 데이터 입력", preferredStyle: UIAlertControllerStyle.Alert)
      
      // TODO : 완성하기
      self.showViewController(dialog, sender: nil)
    }
  }

  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return data.count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("CELL_ID", forIndexPath: indexPath)
    cell.textLabel?.text = data[indexPath.row]
    return cell
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
}

