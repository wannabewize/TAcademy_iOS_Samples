//
//  TodoManager.swift
//  TodoWithMVC
//
//  Created by wannabewize on 2014. 8. 28..
//  Copyright (c) 2014년 VanillaStep. All rights reserved.
//

import UIKit
import RealmSwift

class TodoManager {
   // 싱글턴 메소드
   static var sharedManager  = TodoManager()
   
   var realm : Realm!
   
   init() {
      do {
         realm = try Realm()
      }
      catch let error {
         print("Error : ", error)
         assertionFailure("Can not initialize Realm")
      }
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
   
   func addTodo(title : String, dueDate : NSDate?) {
      let todo = Todo()
      todo.title = title
      todo.dueDate = dueDate
      
      do {
         try realm.write({
            realm.add(todo)
         })
      }
      catch let error {
         print("Error : ", error)
      }
   }
   
   // 모든 할일 객체 얻어오기
   func resolveAllTodo() {
      todoList.removeAll()
      
      let results = realm.objects(Todo)
      print("resolveAllTodo. count: ", results.count)

      for one in results {
         todoList.append(one)
      }
   }
}
