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
      print("bundle path : \(bundlePath)")
      // 번들 내 리소스 경로 얻기
      let imagePath = NSBundle.mainBundle().pathForResource("image", ofType: "png")!
      print("image path : \(imagePath)")
      
      // 홈 폴더
      let homeFolder = NSHomeDirectory()
      print("home : \(homeFolder)")
      
      // 도큐먼트 폴더
      let docFolders = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
      let docFolder = docFolders[0] as NSString
      print("doc folder : \(docFolder)")
      
      let docFolder2 = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true).first!
      print("doc folder2 : \(docFolder2)")
      
      // 파일 경로
      let filePath = "\(docFolder)/image.png"
      print("file path : \(filePath)")
      
      let fm = NSFileManager.defaultManager()
      if false == fm.fileExistsAtPath(filePath) {
         print("파일 없음 - 복사")
         
         do {
            try fm.copyItemAtPath(imagePath, toPath: filePath)
         }
         catch let err {
            print("파일 복사 오류 \(err)")
         }
      }
      else {
         
      }
      
      let tmpPath = NSTemporaryDirectory()
      print("tmp path : \(tmpPath)")
      let str = "Hello World"
      do {
         try str.writeToFile(filePath, atomically: true, encoding: NSUTF8StringEncoding)
      }
      catch {
         print("문자열 파일 저장 에러")
      }
      
      do {
         let str2 = try String(contentsOfFile: filePath, encoding: NSUTF8StringEncoding)
         print("파일 읽기 \(str2)")
         
      }
      catch {
         print("문자열 저장 파일 읽기 오류")
      }
      
      // 배열 - NSArray
      let array : NSArray = ["신정", "구정", "삼일절", "노동절", "어린이날"]
      // 도큐먼트 폴더에 파일 경로
      let arrayFilePath = "\(docFolder)/holiday.plist"
      // 파일로 저장
      array.writeToFile(arrayFilePath, atomically: true)
      
      let array2 = NSArray(contentsOfFile: arrayFilePath)
      print("공유일 : \(array2)")
      
      let filePath4 = NSBundle.mainBundle().pathForResource("holidays", ofType: "plist")!
      let array3 = NSArray(contentsOfFile: filePath4)
      print("plist : \(array3)")
      
   }
   
   override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
   }
   
   
}

