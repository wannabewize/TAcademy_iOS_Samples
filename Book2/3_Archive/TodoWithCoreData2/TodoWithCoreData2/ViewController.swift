//
//  ViewController.swift
//  TodoWithCoreData
//
//  Created by wannabewize on 10/22/15.
//  Copyright © 2015 wannabewize. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   @IBOutlet weak var tableView: UITableView!
   @IBOutlet weak var groupSegment: UISegmentedControl!
   
   var groups : [Group]!
   var todos : [Todo]!
   let formatter = NSDateFormatter()
   // 모델(M)
   var manager : TodoManager!
   
   // 그룹 선택 세그먼티드 컨트롤 변경시(ValueChanged)
   @IBAction func groupChanged(sender: AnyObject) {
      let selection = groupSegment.selectedSegmentIndex
      setTodoWithSelectedGroup(selection)
      tableView.reloadData()
   }
   
   // 현재 선택된 그룹에 해당하는 할일 목록 설정
   func setTodoWithSelectedGroup(groupIndex : Int) {
      // All
      if ( 0 == groupIndex ) {
         todos = manager.todoList
      }
      else {
         // 0은 All이므로 -1
         let group = groups[groupIndex-1]
         todos = group.todos?.allObjects as! [Todo]
      }
   }
   
   func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return todos.count
   }
   
   func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCellWithIdentifier("TODO_CELL", forIndexPath: indexPath)
      
      let todo = todos[indexPath.row]
      
      cell.textLabel!.text = todo.title
      cell.detailTextLabel!.text = formatter.stringFromDate(todo.dueDate!)
      
      return cell
   }
   
   override func viewWillAppear(animated: Bool) {
      setTodoWithSelectedGroup(groupSegment.selectedSegmentIndex)
      tableView.reloadData()
   }
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      // 매니저 준비
      manager = TodoManager.sharedManager
      manager.resolveAllGroup()
      manager.resolveAllTodo()
      groups = manager.groups
      
      // 날짜 포매터
      formatter.dateFormat = "yyyy/MM/dd"
      
      // 그룹 선택용 세그먼트
      groupSegment.removeAllSegments()

      groupSegment.insertSegmentWithTitle("All", atIndex: 0, animated: true)
      for(var i = 0 ; i < groups.count ; i++) {
         let group = groups[i]
         groupSegment.insertSegmentWithTitle(group.title, atIndex: (i+1), animated: true)
      }
      groupSegment.selectedSegmentIndex = 0
   }
}

