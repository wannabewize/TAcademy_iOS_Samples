//
//  TodoManager.swift
//  TodoWithSQLite
//
//  Created by wannabewize on 2015. 3. 26..
//  Copyright (c) 2015년 VanillaStep. All rights reserved.
//

import Foundation
/*



func resolveAll() {
let (resultSet, err) = SD.executeQuery("SELECT * FROM TODO")
if nil != err {
println("Error \(err)")
}
else {
for row in resultSet {
let rowId = row["ID"]?.asInt()
let title = row["title"]?.asString()
let dueDate = row["duedate"]?.asDate()
println("title \(title) due : \(dueDate)")
}
}
}

override func viewWillAppear(animated: Bool) {
//    addTodo("Todo1", dueDate: NSDate())
//    addTodo("Todo2", dueDate: NSDate())
resolveAll()
}

override func viewDidLoad() {
super.viewDidLoad()
//    openDB()
}

override func didReceiveMemoryWarning() {
super.didReceiveMemoryWarning()
// Dispose of any resources that can be recreated.
}


}

*/
struct Todo {
  var rowId : Int
  var title : String
  var dueDate : NSDate?
}

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
  
  init() {
    formatter = NSDateFormatter()
    formatter.dateFormat = "yyyy/MM/dd"
  }
  
  // 데이터베이스
  var db : COpaquePointer = nil
  
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
  
  var formatter : NSDateFormatter!
  
  func addTodo(title : String, dueDate : NSDate) {
    SD.executeQuery("INSERT INTO TODO (TITLE, DUEDATE) VALUES (?, ?)", withArgs: [title, dueDate])
    
    resolveAllTodo()
  }
  
  // 할일 삭제
  func removeTodo(rowId : Int) {
    SD.executeQuery("DELETE FROM todo WHERE rowid=?", withArgs: [rowId])
    
    resolveAllTodo()
  }
  
  // 모든 할일 객체 얻어오기
  func resolveAllTodo() {
    todoList.removeAll(keepCapacity: false)
    
    let (resultSet, err) = SD.executeQuery("SELECT * FROM TODO")
    if nil != err {
      println("Error \(err)")
    }
    else {
      for row in resultSet {
        let rowId = row["ID"]?.asInt()
        let title = row["title"]?.asString()
        let dueDate = row["duedate"]?.asDate()
        println("title \(title) due : \(dueDate)")
        
        let todo = Todo(rowId: rowId!, title: title!, dueDate: dueDate)
        todoList.append(todo)
      }
    }
  }
  
  func openDB() {
    SD.createTable("Todo", withColumnNamesAndTypes: ["title":SwiftData.DataType.StringVal, "duedate":SwiftData.DataType.DateVal])
  }
}
