//
//  TodoComposeViewController.swift
//  TodoWithSQLite
//
//  Created by wannabewize on 2014. 11. 26..
//  Copyright (c) 2014년 VanillaStep. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController {
  
  @IBOutlet weak var textField: UITextField!
  @IBOutlet weak var datePicker: UIDatePicker!
  
  // 취소 - 모달 닫기
  @IBAction func handleCancel(sender: AnyObject) {
    dismissViewControllerAnimated(true, completion: nil)
  }
  
  // 완료 - 델리게이트에게 완료, 모달 닫기
  @IBAction func handleDone(sender: AnyObject) {
    // 모델을 이용해서 할일 저
    let todoTitle = textField.text
    let dueDate = datePicker.date
    TodoManager.sharedManager.addTodo(todoTitle, dueDate : dueDate)
    
    dismissViewControllerAnimated(true, completion: nil)
  }
}
