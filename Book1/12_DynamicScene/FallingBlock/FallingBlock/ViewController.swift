//
//  ViewController.swift
//  FallingBlock
//
//  Created by wannabewize on 2014. 8. 22..
//  Copyright (c) 2014년 VanillaStep. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  var animator : UIDynamicAnimator!
  var boundCollision : UICollisionBehavior!
  var gravityBehavior : UIGravityBehavior!
  
  func handleTap(gesture : UITapGestureRecognizer) {
    // 탭 좌표에 뷰 생성
    let item = UIView(frame: CGRectMake(0, 0, 100, 100))
    item.center = gesture.locationInView(gesture.view)
    
    let red = CGFloat( arc4random() % 255 ) / 255.0
    let green = CGFloat( arc4random() % 255 ) / 255.0
    let blue = CGFloat( arc4random() % 255 ) / 255.0
    
    let blockColor = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    item.backgroundColor = blockColor
    
    self.view.addSubview(item)
    
    gravityBehavior.addItem(item)
    boundCollision.addItem(item)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.animator = UIDynamicAnimator(referenceView: self.view)
    
    let tapGesture = UITapGestureRecognizer(target: self, action:Selector("handleTap:"))
    self.view.addGestureRecognizer(tapGesture)
    
    gravityBehavior = UIGravityBehavior()
    self.animator.addBehavior(gravityBehavior)
    
    boundCollision = UICollisionBehavior()
    boundCollision.setTranslatesReferenceBoundsIntoBoundaryWithInsets(UIEdgeInsetsZero)
    self.animator.addBehavior(boundCollision)
  }
  
}

