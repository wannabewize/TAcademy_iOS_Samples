//
//  ViewController.swift
//  TodoWithCoreData
//
//  Created by wannabewize on 2015. 3. 24..
//  Copyright (c) 2015년 VanillaStep. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  let formatter = NSDateFormatter()
  
  @IBOutlet weak var tableView: UITableView!
  
  // 모델(M)
  var manager : TodoManager!
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return manager.numberOfTodo
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("TODO_CELL", forIndexPath: indexPath) as! UITableViewCell
    
    let todo = manager.todoAt(indexPath.row)
    
    cell.textLabel!.text = todo.title
    cell.detailTextLabel!.text = formatter.stringFromDate(todo.dueDate)
    
    return cell
  }
  
  func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    manager.deleteTodo(indexPath.row)
    manager.resolveAllTodo()
    tableView.reloadData()
  }
  
  override func viewWillAppear(animated: Bool) {
    tableView.reloadData()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()

    // 매니저 준비
    manager = TodoManager.sharedManager
    manager.resolveAllTodo()

    // 날짜 포매터
    formatter.dateFormat = "yyyy/MM/dd"
    
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    println("folder : \(appDelegate.applicationDocumentsDirectory)")
    
//    manager.addGroup("Y2016")
//    manager.setTestRelation()
  }
}

