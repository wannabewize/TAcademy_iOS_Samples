//
//  ViewController.swift
//  ViewOutletAndTag
//
//  Created by wannabewize on 2014. 8. 31..
//  Copyright (c) 2014년 VanillaStep. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var greenView: UIView!
  
  @IBOutlet weak var redView: UIView!
  
  
  var blueView : UIView!
  
  override func viewDidAppear(animated: Bool) {
    // 아웃렛으로 뷰 다루기
    redView.backgroundColor = UIColor.lightGrayColor()
    // 태그를 이용해서 뷰 다루기
    if let greenView = self.view.viewWithTag(2) {
      greenView.backgroundColor = UIColor.lightGrayColor()
    }
    // 코드로 뷰 다루기
    blueView.backgroundColor = UIColor.lightGrayColor()
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // 파란색 뷰 추가
    blueView = UIView(frame: CGRectMake(140, 80, 160, 200))
    blueView.backgroundColor = UIColor.blueColor()
    self.view.addSubview(blueView)
  }
}

