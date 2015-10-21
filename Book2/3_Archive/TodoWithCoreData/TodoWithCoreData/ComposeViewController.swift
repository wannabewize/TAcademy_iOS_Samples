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
  
  @IBAction func handleDone(sender: AnyObject) {
    self.dismissViewControllerAnimated(true, completion: nil)
    let manager = TodoManager.sharedManager
    manager.addTodo(textField.text!, dueDate: datePicker.date)
    // 저장된 내용을 다시 읽어오기
    manager.resolveAllTodo()
  }
  
  @IBAction func handleCancel(sender: AnyObject) {
    self.dismissViewControllerAnimated(true, completion: nil)
  }
}
