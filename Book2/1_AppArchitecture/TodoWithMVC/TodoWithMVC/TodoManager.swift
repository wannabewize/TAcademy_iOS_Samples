//
//  TodoManager.swift
//  TodoWithMVC
//
//  Created by wannabewize on 2014. 8. 28..
//  Copyright (c) 2014년 VanillaStep. All rights reserved.
//

import UIKit

let ModelChangeNotification = "ModelChangeNotification"

class TodoManager {
  // 싱글턴 계산 프로퍼티
  static private var instance : TodoManager!
  static var sharedManager : TodoManager {
    if nil == instance {
      instance = TodoManager()
    }
    return instance
  }
  
  
  init() {
  }
  
  // 할일 배열
  var todoList = [String]()
  
  // 할일 개수
  var count : Int {
    return todoList.count
  }
  
  func removeTodo(index : Int) {
    todoList.removeAtIndex(index)
    
    // 모델 변경을 컨트롤러에게 알림
    NSNotificationCenter.defaultCenter().postNotificationName(ModelChangeNotification, object: nil)
  }
  
  // 할일 - 인덱스로 식별
  func todoAt(index : Int) -> String {
    return todoList[index]
  }
  
  // 새 할일 추가
  func addTodo(todo : String) {
    todoList.append(todo)
    
    // 모델 변경을 컨트롤러에게 알림
    NSNotificationCenter.defaultCenter().postNotificationName(ModelChangeNotification, object: nil)
  }
}
