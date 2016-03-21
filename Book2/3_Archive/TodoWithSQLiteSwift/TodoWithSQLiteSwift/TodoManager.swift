//
//  TodoManager.swift
//  TodoWithSQLite
//
//  Created by wannabewize on 2015. 3. 26..
//  Copyright (c) 2015년 VanillaStep. All rights reserved.
//

import Foundation
import SQLite

struct Todo {
   var todoId : Int
   var title : String
   var dueDate : NSDate?
}

class TodoManager {
   static let sharedManager = TodoManager()
   
   var db : Connection!

   init() {
      formatter = NSDateFormatter()
      formatter.dateFormat = "yyyy/MM/dd"
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
   
   var formatter : NSDateFormatter!
   
   func addTodo(title : String, dueDate : NSDate) {
      
      do {
         let dateStr = formatter.stringFromDate(dueDate)
         try db.run("INSERT INTO TODO (TITLE, DUEDATE) VALUES (?, ?)", title, dateStr)
      }
      catch let error {
         print("INSERT ERROR : ", error)
      }
      
      resolveAllTodo()
   }
   
   // 할일 삭제
   func removeTodo(rowId : Int) {
      
      do {
         try db.run("DELETE FROM todo WHERE rowid=?", rowId)
      }
      catch let error {
         print("DELETE ERROR : ", error)
      }
      
      resolveAllTodo()
   }
   
   // 모든 할일 객체 얻어오기
   func resolveAllTodo() {
      todoList.removeAll(keepCapacity: false)
      
      if let statement = try? db.run("SELECT id, title, duedate FROM todo") {
         for (index, row) in statement.enumerate() {
            // print(index, row)
            let todoId = Int(row[0] as! Int64)
            let title = row[1] as! String
            let dateStr = row[2] as! String
            let dueDate = formatter.dateFromString(dateStr)
            
            // Todo 객체
            let todo = Todo(todoId: todoId, title: title, dueDate: dueDate)
            todoList.append(todo)
         }
      }
   }
   
   func openDB() {
      // 데이터베이스 파일 경로
      let docPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true).first!
      let filePath = "\(docPath)/todo.sqlite"
      print(filePath)
      
      do {
         db = try Connection(filePath)
         // 테이블 생성
         try db.execute("CREATE TABLE IF NOT EXISTS todo ( id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, duedate DATE )")
      }
      catch let error {
         print("Error : ", error)
      }
   }
}
