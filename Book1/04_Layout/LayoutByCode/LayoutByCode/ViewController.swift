//
//  ViewController.swift
//  LayoutByCode
//
//  Created by wannabewize on 2014. 12. 22..
//  Copyright (c) 2014년 VanillaStep. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    
    let label = UILabel()
    label.text = "Layout By Code"
    label.font = UIFont.systemFontOfSize(24)
    label.backgroundColor = UIColor.lightGrayColor()
    self.view.addSubview(label)
    
    label.setTranslatesAutoresizingMaskIntoConstraints(false)

    // 왼쪽으로 20 포인트 여백
    let leftConstraint = NSLayoutConstraint(item: label, attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal, toItem: label.superview, attribute: NSLayoutAttribute.LeftMargin, multiplier: 1.0, constant: 20)
    // 상단으로 20포인트 여백
    let topConstraint = NSLayoutConstraint(item: label, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: label.superview, attribute: NSLayoutAttribute.TopMargin, multiplier: 1.0, constant: 20)
    // 부모뷰에 제약조건 객체 추가
    label.superview?.addConstraints([leftConstraint, topConstraint])
    
    // 크기 제약조건
    let widthConstraint = NSLayoutConstraint(item: label, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: 300)
    // 해당 뷰에 제약조건 추가
    label.addConstraint(widthConstraint)
    
    let label1 = UILabel()
    label1.text = "첫 번째 레이블"
    label1.font = UIFont.systemFontOfSize(20)
    self.view.addSubview(label1)
    
    let label2 = UILabel()
    label2.text = "두 번째 레이블"
    label2.font = UIFont.systemFontOfSize(20)
    self.view.addSubview(label2)
    
    label1.setTranslatesAutoresizingMaskIntoConstraints(false)
    label2.setTranslatesAutoresizingMaskIntoConstraints(false)
    
    // 비주얼 포맷 언어에서 사용하는 뷰
    let views = ["label1":label1, "label2":label2]
    // 비주얼 포맷 언어로 제약조건 객체 생성
    let horizontalConstraints = NSLayoutConstraint.constraintsWithVisualFormat("|-20-[label1]-20-[label2]", options: NSLayoutFormatOptions.AlignAllBaseline, metrics: nil, views: views)
    let verticalConstraints = NSLayoutConstraint.constraintsWithVisualFormat("V:|-100-[label1]", options: NSLayoutFormatOptions.AlignAllTop, metrics: nil, views: views)
    
    // 부모뷰에 제약조건 추가
    self.view.addConstraints(horizontalConstraints)
    self.view.addConstraints(verticalConstraints)
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

