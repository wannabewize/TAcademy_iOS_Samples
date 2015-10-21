//
//  TodoManager.swift
//  TodoWithMVC
//
//  Created by wannabewize on 2014. 8. 28..
//  Copyright (c) 2014년 VanillaStep. All rights reserved.
//

import UIKit
import CoreData

class TodoManager {
  // 싱글턴 메소드
  class var sharedManager : TodoManager {
    struct Instance {
      static var instance : TodoManager!
    }
    
    if Instance.instance == nil {
      Instance.instance = TodoManager()
    }
    
    return Instance.instance
  }  
  
  // 할일 배열
  var todoList = [Todo]()
  
  // 할일 개수
  var numberOfTodo : Int {
    return todoList.count
  }
  
  // 할일 - 인덱스로 식별
  func todoAt(index : Int) -> Todo {
    return todoList[index]
  }
  
  func addTodo(title : String, dueDate : NSDate) {
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    let context = appDelegate.managedObjectContext!
    
    // 새로운 할일 객체 생성 - 엔티티 디스크립션
    let newTodo = NSEntityDescription.insertNewObjectForEntityForName("Todo", inManagedObjectContext: context) as! Todo
    
    newTodo.title = title
    newTodo.dueDate = dueDate
    
    // 저장소에 저장
    do {
      try context.save()
    }
    catch let err {
      print("에러 \(err)")
    }
  }
  
  // 모든 할일 객체 얻어오기
  func resolveAllTodo() {
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    let context = appDelegate.managedObjectContext!
    
    // 할일을 얻기위한 요청
    let requeset = NSFetchRequest(entityName: "Todo")
    var error : NSError?

    // 마감일 기준 정렬
    let sort = NSSortDescriptor(key: "dueDate", ascending: true)
    requeset.sortDescriptors = [sort]


    // 요청 실행
    do {
      let ret = try context.executeFetchRequest(requeset)
      // 요청 성공
      todoList = ret as! [Todo]
      print("resolve \(todoList.count) todos.")
    } catch let error1 as NSError {
      error = error1
      // 요청 실패
      print("Error : \(error?.localizedDescription)")
    }
  }
}
