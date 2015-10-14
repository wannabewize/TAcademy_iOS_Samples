//
//  ViewController.swift
//  Toolbar
//
//  Created by wannabewize on 2015. 3. 18..
//  Copyright (c) 2015년 wannabewize. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    
    // 툴바 생성
    let toolbar = UIToolbar(frame: CGRectMake(0, 20, self.view.frame.size.width, 44))
    
    // 이미지 기반의 바 버튼
    let image = UIImage(named: "button")! // 옵셔널
    let imageBarButton = UIBarButtonItem(image: image, style: UIBarButtonItemStyle.Plain, target: self, action: Selector("handleImageButton:"))
    
    // 글자 기반의 바 버튼
    let textBarButton = UIBarButtonItem(title: "문자열 버튼", style: UIBarButtonItemStyle.Plain, target: self, action: Selector("handleTextButton:"))
    
    // 여백
    let space = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
    
    // 시스템 바 버튼
    let doneBarButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Done, target: self, action: "handleDone:") // 문자열 만으로 셀렉터 객체 생성

    // 툴바에 아이템(바 버튼) 배열 설정
    toolbar.items = [imageBarButton, textBarButton, space, doneBarButton]
    
    // 뷰 구조에 추가
    self.view.addSubview(toolbar)
  }
  
  func handleImageButton(sender : AnyObject) {
    print("이미지 버튼 누름")
  }
  
  func handleTextButton(sender : AnyObject) {
    print("글자 버튼 누름")
  }
  
  // 셀렉터는 파라미터의 타입과 상관없다.
  func handleDone(sender : UIBarButtonItem) {
    print("완료 버튼 누름")
  }
}

