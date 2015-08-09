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
  
  func addGroup(title : String) {
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    let context = appDelegate.managedObjectContext!
    
    let group = NSEntityDescription.insertNewObjectForEntityForName("Group", inManagedObjectContext: context) as! Group
    group.title = title

    appDelegate.saveContext()
  }
  
  func addTodo(title : String, dueDate : NSDate) {
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    let context = appDelegate.managedObjectContext!
    
    // 새로운 할일 객체 생성 - 엔티티 디스크립션
    let newTodo = NSEntityDescription.insertNewObjectForEntityForName("Todo", inManagedObjectContext: context) as! Todo
    
    newTodo.title = title
    newTodo.dueDate = dueDate
    
    // 저장소에 저장
    var error : NSError?
    
    if false == context.save(&error) {
      println("에러 \(error?.localizedDescription)")
    }
  }
  
  var groups : [Group]!
  func resolveAllGroup() {
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    let context = appDelegate.managedObjectContext!
    
    let request = NSFetchRequest(entityName: "Group")
    var error : NSError?
    
    groups = context.executeFetchRequest(request, error: &error) as! [Group]
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
    if let ret = context.executeFetchRequest(requeset, error: &error) {
      // 요청 성공
      todoList = ret as! [Todo]
      println("resolve \(todoList.count) todos.")
    }
    else {
      // 요청 실패
      println("Error : \(error?.localizedDescription)")
    }
    
    resolveAllGroup()
  }
  
  func deleteTodo(index : Int) {
    let todo = self.todoAt(index)
    
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    let context = appDelegate.managedObjectContext!
    
    context.deleteObject(todo)
    var error : NSError?
    if false == context.save(&error) {
      println("에러 \(error?.localizedDescription)")
    }
  }
  
  func setTestRelation() {
    let groupIndex = 0
    let todoIndex = 0
    
    let group = groups[groupIndex]
    let todo = todoList[todoIndex]
    
    // 기존의 할일 목록(todos)에 할일 추가
    let todos = group.todos
    // NSSet이므로 NSMutableSet 생성 후 추가
    var newTodos = NSMutableSet(set: todos)
    newTodos.addObject(todo)
    group.todos = newTodos
    // Inverse 관계면, 역 관계도 자동으로 성립
//    todo.group = group
    
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    let context = appDelegate.managedObjectContext!
    
    // 저장소에 저장
    var error : NSError?
    if false == context.save(&error) {
      println("에러 \(error?.localizedDescription)")
    }
  }
}
