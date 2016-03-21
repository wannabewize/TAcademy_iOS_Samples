//
//  TodoManager.swift
//  TodoWithSQLite
//
//  Created by wannabewize on 2015. 3. 26..
//  Copyright (c) 2015년 VanillaStep. All rights reserved.
//

import Foundation

struct Todo {
   var rowId : Int
   var title : String
   var dueDate : NSDate?
}

class TodoManager {
   // 싱글턴 메소드
   static let sharedManager = TodoManager()
   
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
      let dateStr = formatter.stringFromDate(dueDate)
      
      let sql = String(format: "INSERT INTO TODO (TITLE, DUEDATE ) VALUES ('%@', '%@')", title, dateStr)
      
      var error : UnsafeMutablePointer<Int8> = nil
      let ret = sqlite3_exec(db, sql, nil, nil, &error)
      assert(SQLITE_OK == ret, "새 할일 작성 실패")
      
      resolveAllTodo()
   }
   
   // 할일 삭제
   func removeTodo(rowId : Int) {
      let sql = String(format: "DELETE FROM todo WHERE rowid=%d", rowId)
      var error : UnsafeMutablePointer<Int8> = nil
      let ret = sqlite3_exec(db, sql, nil, nil, &error)
      assert(SQLITE_OK == ret, "삭제 실패")
      
      resolveAllTodo()
   }
   
   // 모든 할일 객체 얻어오기
   func resolveAllTodo() {
      
      todoList.removeAll(keepCapacity: false)
      
      let sql = "SELECT rowid, title, duedate FROM todo ORDER BY duedate"
      var stmt : COpaquePointer = nil
      
      let ret = sqlite3_prepare_v2(db, sql, -1, &stmt, nil)
      
      assert(SQLITE_OK == ret, "Stmt preparing 실패")
      
      while SQLITE_ROW == sqlite3_step(stmt) {
         let rowId = Int(sqlite3_column_int(stmt, 0))
         let buf = UnsafePointer<CChar>(sqlite3_column_text(stmt, 1))
         let title = String.fromCString(buf)!
         
         let buf2 = UnsafePointer<Int8>(sqlite3_column_text(stmt, 2))
         
         let dateStr = String.fromCString(buf2)!
         let dueDate = formatter.dateFromString(dateStr)
         
         let todo = Todo(rowId: rowId, title: title, dueDate: dueDate)
         todoList.append(todo)
      }
   }
   
   func openDB() {
      let docPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true).first!
      let filePath = "\(docPath)/todo.sqlite"
      
      // SQLite 클라이언트에서 열기 쉽도록
      print("docPath : \(docPath)")
      
      let retOpen = sqlite3_open(filePath, &db)
      assert(SQLITE_OK == retOpen, "데이터베이스 오픈 실패")
      
      let sql = "CREATE TABLE IF NOT EXISTS TODO ( TITLE text, DUEDATE date )"
      var error : UnsafeMutablePointer<Int8> = nil
      let ret = sqlite3_exec(db, sql, nil, nil, &error)
      
      assert(SQLITE_OK == ret, "테이블 생성 실패")
   }
}
