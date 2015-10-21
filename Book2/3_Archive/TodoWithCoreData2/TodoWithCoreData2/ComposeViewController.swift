//
//  ComposeViewController.swift
//  TodoWithCoreData
//
//  Created by wannabewize on 2015. 3. 24..
//  Copyright (c) 2015년 VanillaStep. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController {
   
   @IBOutlet weak var textField: UITextField!
   @IBOutlet weak var datePicker: UIDatePicker!
   @IBOutlet weak var groupSegment: UISegmentedControl!
   
   @IBAction func handleDone(sender: AnyObject) {
      self.dismissViewControllerAnimated(true, completion: nil)
      let manager = TodoManager.sharedManager

      // 선택한 그룹
      let groupIndex = groupSegment.selectedSegmentIndex
      let group = manager.groups[groupIndex]
      
      manager.addTodo(textField.text!, dueDate: datePicker.date, group:group)
      // 저장된 내용을 다시 읽어오기
      manager.resolveAllTodo()
   }
   
   @IBAction func handleCancel(sender: AnyObject) {
      self.dismissViewControllerAnimated(true, completion: nil)
   }
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      let manager = TodoManager.sharedManager;
      let groups = manager.groups;
      
      // 씬에 그룹 선택용 세그먼티드 컨트롤 작성
      groupSegment.removeAllSegments()
      
      for(var i = 0 ; i < groups.count ; i++) {
         let group = groups[i]
         groupSegment.insertSegmentWithTitle(group.title, atIndex: i, animated: true)
      }
      groupSegment.selectedSegmentIndex = 0
   }
}
