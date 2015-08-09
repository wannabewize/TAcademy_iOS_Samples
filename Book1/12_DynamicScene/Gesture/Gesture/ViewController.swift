//
//  ViewController.swift
//  Gesture
//
//  Created by wannabewize on 2015. 3. 19..
//  Copyright (c) 2015년 wannabewize. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  @IBOutlet weak var imageView: UIImageView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let pinchGesture = UIPinchGestureRecognizer(target: self, action: Selector("handlePinch:"))
    imageView.addGestureRecognizer(pinchGesture)
    
    let rotateGesture = UIRotationGestureRecognizer(target: self, action: Selector("handleRotate:"))
    imageView.addGestureRecognizer(rotateGesture)
    
    let tapGesture = UITapGestureRecognizer(target: self, action: "handleTap:")
    imageView.addGestureRecognizer(tapGesture)
    
    let panGesture = UIPanGestureRecognizer(target: self, action: "handlePan:")
    imageView.addGestureRecognizer(panGesture)
  }
  
  func handlePinch(gesture : UIPinchGestureRecognizer) {
    let scale = gesture.scale
    let transform = CGAffineTransformScale(imageView.transform, scale, scale)
    imageView.layer.setAffineTransform(transform)
    
    // 연속된 제스처 이벤트이므로 다시 초기화
    gesture.scale = 1.0
  }
  
  func handleTap(gesture : UITapGestureRecognizer) {
    let point = gesture.locationInView(gesture.view)
    println("탭 좌표 : \(point)")
  }
  
  func handleRotate(gesture : UIRotationGestureRecognizer) {
    println("회전")
    let rotation = gesture.rotation
    let transform = CGAffineTransformRotate(imageView.transform, rotation)
    imageView.layer.setAffineTransform(transform)
    
    // 연속된 제스처 이벤트이므로 초기화
    gesture.rotation = 0.0
  }
  
  func handlePan(gesture : UIPanGestureRecognizer) {
    let translation = gesture.translationInView(gesture.view!)
    let transform = CGAffineTransformTranslate(imageView.transform, translation.x, translation.y)
    
    imageView.layer.setAffineTransform(transform)
    // 초기화
    gesture.setTranslation(CGPointZero, inView: gesture.view)
  }
}

