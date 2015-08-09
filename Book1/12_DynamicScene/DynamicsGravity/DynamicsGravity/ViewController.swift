//
//  ViewController.swift
//  DynamicsGravity
//
//  Created by wannabewize on 2015. 8. 8..
//  Copyright (c) 2015년 wannabewize. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  var animator : UIDynamicAnimator!

  override func viewDidLoad() {
    super.viewDidLoad()
    
    // 뷰 생성
    let block = UIView(frame: CGRectMake(50, 20, 100, 100))
    block.backgroundColor = UIColor.redColor()
    self.view.addSubview(block)
    
    // 애니메이터 생성
    animator = UIDynamicAnimator(referenceView: self.view)
    
    let gravity = UIGravityBehavior(items: [block])
    animator.addBehavior(gravity)
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

