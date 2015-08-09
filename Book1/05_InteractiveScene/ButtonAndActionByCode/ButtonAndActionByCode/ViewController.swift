//
//  ViewController.swift
//  ButtonAndActionByCode
//
//  Created by wannabewize on 2015. 1. 26..
//  Copyright (c) 2015년 VanillaStep. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  var colorView : UIView!
  

  override func viewDidLoad() {
    super.viewDidLoad()
    
    colorView = UIView()
    colorView.backgroundColor = UIColor.grayColor()
    self.view.addSubview(colorView)
    
//    colorView.frame = CGRectMake(20, 80, self.view.frame.size.width - 40, self.view.frame.size.height - 100)

    colorView.setTranslatesAutoresizingMaskIntoConstraints(false)
    // 가로 제약조건
    let constraint1 = NSLayoutConstraint.constraintsWithVisualFormat("|-20-[colorView]-20-|", options: NSLayoutFormatOptions(0), metrics: nil, views: ["colorView":colorView])
    // 세로 제약조건
    let constraint2 = NSLayoutConstraint.constraintsWithVisualFormat("V:|-80-[colorView]-20-|", options: NSLayoutFormatOptions(0), metrics: nil, views: ["colorView":colorView])
    self.view.addConstraints(constraint1)
    self.view.addConstraints(constraint2)

    // 버튼 배치
    let button1 = UIButton()
    button1.setTitle("Red", forState: UIControlState.Normal)
    button1.setTitleColor(UIColor.redColor(), forState: UIControlState.Normal)
    self.view.addSubview(button1)
    
    let button2 = UIButton()
    button2.setTitle("Green", forState: UIControlState.Normal)
    button2.setTitleColor(UIColor.greenColor(), forState: UIControlState.Normal)
    self.view.addSubview(button2)
    
    let button3 = UIButton()
    button3.setTitle("Blue", forState: UIControlState.Normal)
    button3.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
    self.view.addSubview(button3)
    
//    button1.frame = CGRectMake(20, 40, 60, 40)
//    button2.frame = CGRectMake(self.view.frame.size.width/2-30, 40, 60, 40)
//    button3.frame = CGRectMake(self.view.frame.size.width - 80, 40, 60, 40)
    
    // 버튼 1,2,3의 제약조건
    button1.setTranslatesAutoresizingMaskIntoConstraints(false)
    button2.setTranslatesAutoresizingMaskIntoConstraints(false)
    button3.setTranslatesAutoresizingMaskIntoConstraints(false)
    
    let constraintViews = ["button1":button1, "button2":button2, "button3":button3]

    // 버튼2의 중앙
    let constraint3 = NSLayoutConstraint(item: button2, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: button2.superview, attribute: NSLayoutAttribute.CenterX, multiplier: 1.0, constant: 0)
    // 버튼1,2,3의 거리
    let constraint4 = NSLayoutConstraint.constraintsWithVisualFormat("[button1]-60-[button2]-50-[button3]", options: NSLayoutFormatOptions.AlignAllBaseline, metrics: nil, views: constraintViews)
    // 버튼2의 세로
    let constraint5 = NSLayoutConstraint.constraintsWithVisualFormat("V:|-40-[button2]", options: NSLayoutFormatOptions(0), metrics: nil, views: constraintViews)

    self.view.addConstraint(constraint3)
    self.view.addConstraints(constraint4)
    self.view.addConstraints(constraint5)
    
    button1.addTarget(self, action: Selector("changeRed:"), forControlEvents: UIControlEvents.TouchUpInside)
    // 문자열로 셀랙터 대체
    button2.addTarget(self, action: "changeGreen:", forControlEvents: UIControlEvents.TouchUpInside)
    button3.addTarget(self, action: "changeBlue:", forControlEvents: UIControlEvents.TouchUpInside)
  }
  
  func changeRed(sender : AnyObject) {
    colorView.backgroundColor = UIColor.redColor()
  }
  
  func changeGreen(sender : AnyObject) {
    colorView.backgroundColor = UIColor.greenColor()
  }
  
  func changeBlue(sender : AnyObject) {
    colorView.backgroundColor = UIColor.blueColor()
  }
}

