//
//  ViewController.swift
//  ThreeViewsByCode
//
//  Created by wannabewize on 2014. 8. 17..
//  Copyright (c) 2014년 VanillaStep. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  // 씬 전체에서 접근하기 위한 프로퍼티
  var redView : UIView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // 뷰의 위치와 크기 Rect 구조체 객체 생성
    // 뷰 객체 생성
    // 배경색 설정, 투명도 설정
    // 부모 뷰에 추가
    let frame = CGRectMake(20, 40, 200, 200)
    redView = UIView(frame:frame)
    redView.backgroundColor = UIColor.redColor()
    redView.alpha = 0.6
    self.view.addSubview(redView)
    
    // 뷰 생성자에서 Rect 객체 생성하기
    // 배경색 RGBA 값 입력
    let blueView = UIView(frame: CGRectMake(100, 100, 200, 200))
    blueView.backgroundColor = UIColor(red: 0, green: 0, blue: 1.0, alpha: 0.7)
    self.view.addSubview(blueView)
    
    // 뷰 객체 생성하고 바로 뷰 구조체 추가하기
    // 뷰 구조에 추가된 이후에 뷰 속성 설정하기
    let greenView = UIView()
    self.view.addSubview(greenView)
    greenView.frame = CGRectMake(50, 200, 200, 200)
    greenView.backgroundColor = UIColor.greenColor()
    greenView.alpha = 0.8
  }
}

