//
//  ViewController.swift
//  Button
//
//  Created by wannabewize on 2015. 1. 26..
//  Copyright (c) 2015년 VanillaStep. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  var textButton : UIButton!
  var imageButton : UIButton!

  override func viewDidLoad() {
    super.viewDidLoad()
    
    // AnyObject를 반환
    let infoButton = UIButton(type: UIButtonType.InfoLight)
    // 버튼의 크기는 미리 정해져있다.
    infoButton.center = CGPointMake(50, 150)
    self.view.addSubview(infoButton)
    
    // 커스텀 버튼
    textButton = UIButton(frame: CGRectMake(50, 50, 100, 50))
    print("button type : \(textButton.buttonType.rawValue)")
    // 보통 상태의 글자와 글자색
    textButton.setTitle("글자 버튼", forState: UIControlState.Normal)
    textButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
    
    // 터치 상태의 글자와 글자색
    textButton.setTitle("터치중", forState: UIControlState.Highlighted)
    textButton.setTitleColor(UIColor.redColor(), forState: UIControlState.Highlighted)
    // 버튼을 뷰에 추가
    self.view.addSubview(textButton)
    
    // 버튼 타입 지정하며 생성
    imageButton = UIButton(type: UIButtonType.Custom)
    imageButton.frame = CGRectMake(50, 200, 100, 50)
    
    // 보통 상태의 이미지
    let normalImage = UIImage(named: "like_button.png")
    imageButton.setImage(normalImage, forState: UIControlState.Normal)
    
    // 사용할 수 없을 때의 이미지
    let disabledImage = UIImage(named: "like_button_disabled.png")
    imageButton.setImage(disabledImage, forState: UIControlState.Disabled)
    
    self.view.addSubview(imageButton)
  }
  
  override func viewDidAppear(animated: Bool) {
    // 사용 불가로 변경
    imageButton.enabled = false
  }
}

