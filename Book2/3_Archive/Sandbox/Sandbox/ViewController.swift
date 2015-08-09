//
//  ViewController.swift
//  Sandbox
//
//  Created by wannabewize on 2015. 3. 26..
//  Copyright (c) 2015년 VanillaStep. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // 번들 폴더 경로
    let bundlePath = NSBundle.mainBundle().bundlePath
    println("bundle path : \(bundlePath)")
    // 번들 내 리소스 경로 얻기
    let imagePath = NSBundle.mainBundle().pathForResource("image", ofType: "png")!
    println("image path : \(imagePath)")
    
    // 홈 폴더
    let homeFolder = NSHomeDirectory()
    println("home : \(homeFolder)")
    
    // 도큐먼트 폴더
    let docFolders = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true) as! [String]
    let docFolder = docFolders[0]
    println("doc folder : \(docFolder)")
    
    // 파일 경로
    let filePath = docFolder.stringByAppendingPathComponent("image.png")
    println("file path : \(filePath)")
    
    let fm = NSFileManager.defaultManager()
    if false == fm.fileExistsAtPath(filePath) {
      println("파일 없음 - 복사")
      var error : NSError?
      fm.copyItemAtPath(imagePath, toPath: filePath, error: &error)
    }
    else {
      println("파일 있음")
    }
    
//    let tmpPath = NSTemporaryDirectory()
//    println("tmp path : \(tmpPath)")
//    var error : NSError?
//    let str = "Hello World"
//    str.writeToFile(filePath, atomically: true, encoding: NSUTF8StringEncoding, error: &error)
//
//    let str2 = String(contentsOfFile: filePath, encoding: NSUTF8StringEncoding, error: &error)
    

    // Do any additional setup after loading the view, typically from a nib.

    let filePath3 = docFolder.stringByAppendingPathComponent("array.plist")
    let array : NSArray = [1,2,3]
    array.writeToFile(filePath3, atomically: true)
    
    let array2 = NSArray(contentsOfFile: filePath3)
    println("공유일 : \(array2)")
    
    
    let filePath4 = NSBundle.mainBundle().pathForResource("holidays", ofType: "plist")!
    let array3 = NSArray(contentsOfFile: filePath4)
    println("plist : \(array3)")

  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

