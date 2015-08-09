//
//  ViewController.swift
//  Touch
//
//  Created by wannabewize on 2015. 3. 19..
//  Copyright (c) 2015년 wannabewize. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  // 이미지 뷰 아웃렛
  @IBOutlet weak var imageView: UIImageView!
  // 이미지 내부 터치
  var holdingImage : Bool = false
  
  // 터치 시작
  override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
    let touch = touches.first as! UITouch
    let point = touch.locationInView(touch.view)
    
    if CGRectContainsPoint(imageView.frame, point) {
      holdingImage = true
    }
    else {
      holdingImage = false
    }
  }
  
  // 터치 이동
  override func touchesMoved(touches: Set<NSObject>, withEvent event: UIEvent) {
    if holdingImage {
      let touch = touches.first as! UITouch
      let point = touch.locationInView(touch.view)
      
      imageView.center = point
    }
  }
  
  // 터치 끝
  override func touchesEnded(touches: Set<NSObject>, withEvent event: UIEvent) {
  }
}

