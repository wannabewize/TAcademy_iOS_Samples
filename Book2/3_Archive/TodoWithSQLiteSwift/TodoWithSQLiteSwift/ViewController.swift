//
//  ViewController.swift
//  TodoWithSQLiteSwift
//
//  Created by wannabewize on 2016. 3. 18..
//  Copyright © 2016년 VanillaStep. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
   @IBOutlet weak var tableView : UITableView!
   var formatter : NSDateFormatter!
   // 모델
   var manager : TodoManager!
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      formatter = NSDateFormatter()
      formatter.dateFormat = "yyyy/MM/dd"
      
      manager = TodoManager.sharedManager
      manager.openDB()
      manager.resolveAllTodo()
   }
   
   // 삭제
   func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
      let todo = manager.todoAt(indexPath.row)
      manager.removeTodo(todo.todoId)
      
      tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
   }
   
   func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return manager.numberOfTodo
   }
   
   func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCellWithIdentifier("TodoCell", forIndexPath: indexPath)
      // 할일 객체
      let todo = manager.todoAt(indexPath.row)
      cell.textLabel!.text = todo.title
      cell.detailTextLabel?.text = formatter.stringFromDate(todo.dueDate!)
      
      return cell
   }
   
   override func viewWillAppear(animated: Bool) {
      tableView.reloadData()
   }
   

}

