//
//  ViewController.swift
//  TabBasedApp
//
//  Created by wannabewize on 2015. 3. 24..
//  Copyright (c) 2015년 VanillaStep. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  // 텍스트필드 아웃렛 연결
  @IBOutlet weak var textField: UITextField!
  
  // 텍스트필드 - Did End On Exit 이벤트 연결
  @IBAction func textfieldDidEndOnExit(sender: AnyObject) {
    // 엔터로 편집 끝나면서, 공유 데이터 저장
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    appDelegate.sharedData = textField.text
  }
  
  // 씬 전환되면서 공유 데이터를 화면에 반영
  override func viewWillAppear(animated: Bool) {
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    textField.text = appDelegate.sharedData
  }
  
  override func viewDidLoad() {
    let tabBar = self.tabBarController!.tabBar
    
    // 탭바 속성 변경하기
    tabBar.tintColor = UIColor.redColor()
    tabBar.barTintColor = UIColor.orangeColor()
    tabBar.tintColor = UIColor.blackColor()
    
    // 씬의 탭바 아이템 속성 설정
    self.tabBarItem.title = "제목"
    self.tabBarItem.badgeValue = "배지"
  }
}

