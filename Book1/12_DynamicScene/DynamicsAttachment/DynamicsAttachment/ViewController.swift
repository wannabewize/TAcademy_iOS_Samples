//
//  ViewController.swift
//  DynamicsAttachment
//
//  Created by wannabewize on 2015. 8. 8..
//  Copyright (c) 2015년 wannabewize. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  var block1 : UIView!
  var block2 : UIView!
  
  var animator : UIDynamicAnimator!
  
  var attach : UIAttachmentBehavior!

  override func viewDidLoad() {
    super.viewDidLoad()

    // 두 개의 아이템 준비
    block1 = UIView(frame: CGRectMake(20, 20, 100, 100))
    block1.backgroundColor = UIColor.redColor()
    self.view.addSubview(block1)
    
    block2 = UIView(frame: CGRectMake(100, 100, 100, 100))
    block2.backgroundColor = UIColor.blueColor()
    self.view.addSubview(block2)
    
    // 애니메이터 객체 생성 - 지역 변수로 작성하면 메모리에서 해제됨
    animator = UIDynamicAnimator(referenceView: self.view)
    // 두 뷰를 연결
    attach = UIAttachmentBehavior(item: block1, attachedToItem: block2)
    // 연결 속성
    attach.length = 100
    attach.damping = 5
    attach.frequency = 5
    
    // 애니메이터에 추가
    animator.addBehavior(attach)
    
    // 아이템 하나 끌기
    let panGesture = UIPanGestureRecognizer(target: self, action: "handlePan:")
    block1.addGestureRecognizer(panGesture)
  }
  
  func handlePan(gesture : UIPanGestureRecognizer) {
    // 뷰 이동
    let point = gesture.locationInView(self.view)
    block1.center = point
    
    // 애니메이션 업데이트
    animator.updateItemUsingCurrentState(block1)
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

