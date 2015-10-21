//
//  ViewController.swift
//  Sqlite
//
//  Created by wannabewize on 2015. 3. 26..
//  Copyright (c) 2015년 VanillaStep. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  var db : COpaquePointer = nil
  
  func openDB() {
    let docPath = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)[0] as NSString
    let filePath = docPath.stringByAppendingPathComponent("database.sqlite")
    print("docPath : \(docPath)")
    let ret = sqlite3_open(filePath, &db)
    if SQLITE_OK == ret {
      // 데이터베이스 오픈 성공
      print("오픈 성공")
    }
    else {
      // 데이터베이스 오픈 실패
      let errorMsg = String.fromCString(sqlite3_errmsg(db))      
      print("Error : \(errorMsg)")
    }
  }
  
  func createTable() {
    let sql = "CREATE TABLE IF NOT EXISTS TODO ( TITLE text, DUEDATE date )"
    var error : UnsafeMutablePointer<Int8> = nil
    sqlite3_exec(db, sql, nil, nil, &error)
    
    
  }
  
  override func viewWillAppear(animated: Bool) {
    openDB()
    createTable()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()

    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

