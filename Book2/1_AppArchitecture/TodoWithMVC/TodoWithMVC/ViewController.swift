//
//  ViewController.swift
//  TodoWithMVC
//
//  Created by wannabewize on 2015. 3. 23..
//  Copyright (c) 2015년 wannabewize. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

  // 모델(M)
  let manager = TodoManager.sharedManager
  
  @IBOutlet weak var textField: UITextField!
  @IBOutlet weak var tableView: UITableView!
  
  // 새 할일 추가 버튼의 액션 메소드
  @IBAction func addNewTodo(sender: AnyObject) {
    // 모델에 할일 추가
    let todo = textField.text
    manager.addTodo(todo)
    
    // 키보드
    textField.resignFirstResponder()
    // 텍스트필드 정리
    textField.text = ""
  }
  
  // MARK: 모델 변경 노티
  func handleModelChange(noti : NSNotification) {
    // 모델에 변경이 생기면 - 뷰에 반영
    tableView.reloadData()
  }

  // MARK: 뷰 라이프사이클
  override func viewDidAppear(animated: Bool) {
    // 모델 변경 감시 객체 등록
    NSNotificationCenter.defaultCenter().addObserver(self, selector: "handleModelChange:", name: ModelChangeNotification, object: nil)
  }
    
  override func viewWillDisappear(animated: Bool) {
    NSNotificationCenter.defaultCenter().removeObserver(self)
  }

  // MARK:테이블 뷰 데이터소스/델리게이트
  func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    let index = indexPath.row
    manager.removeTodo(index)
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    println("number of todo \(manager.count)")
    return manager.count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("TODO_CELL", forIndexPath: indexPath) as UITableViewCell
    
    // 모델에서 할일 정보 얻기
    let todo = manager.todoAt(indexPath.row)
    cell.textLabel!.text = todo
    
    return cell
  }
}

