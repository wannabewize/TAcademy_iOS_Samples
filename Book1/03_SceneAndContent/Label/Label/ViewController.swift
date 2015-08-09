//
//  ViewController.swift
//  Label
//
//  Created by wannabewize on 2014. 12. 21..
//  Copyright (c) 2014년 VanillaStep. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    
    let label1 = UILabel(frame: CGRectMake(50, 50, 200, 40))
    label1.text = "일반 레이블"
    label1.textColor = UIColor.blueColor()
    label1.font = UIFont.systemFontOfSize(15)
    self.view.addSubview(label1)
    
    let label2 = UILabel(frame: CGRectMake(50, 100, 200, 40))
    label2.text = "Marker Felt font Label"
    label2.font = UIFont(name: "Marker Felt", size: 20)
    self.view.addSubview(label2)
    
    let headlineLabel = UILabel(frame: CGRectMake(50, 150, 0, 0))
    headlineLabel.text = "Headline Text Style"
    headlineLabel.font = UIFont.preferredFontForTextStyle(UIFontTextStyleHeadline)
    // intrinsic size
    headlineLabel.sizeToFit()
    self.view.addSubview(headlineLabel)
    
    let lineBreakLabel = UILabel(frame: CGRectMake(50, 200, 100, 40))
    lineBreakLabel.text = "View Size and Text Size"
    // 중간 축약
    lineBreakLabel.lineBreakMode = NSLineBreakMode.ByTruncatingMiddle
    lineBreakLabel.font = UIFont.systemFontOfSize(30)
    self.view.addSubview(lineBreakLabel)
    
    let autoshrinkLabel = UILabel(frame: CGRectMake(50, 250, 100, 40))
    autoshrinkLabel.text = "Autoshrink Text"
    autoshrinkLabel.font = UIFont.systemFontOfSize(30)
    // 0.3배까지 폰트 크기 조정
    autoshrinkLabel.adjustsFontSizeToFitWidth = true
    autoshrinkLabel.minimumScaleFactor = 0.3
    self.view.addSubview(autoshrinkLabel)
    
    let multilineLabel = UILabel(frame: CGRectMake(50, 300, 100, 80))
    multilineLabel.text = "여러 줄에 텍스트 출력하기"
    // 레이블의 높이가 허용하는 크기까지 여러줄로 출력
    multilineLabel.numberOfLines = 0
    self.view.addSubview(multilineLabel)

    // 속성 문자열
    let attributedStr = NSMutableAttributedString(string: "Attributed Text")
    // 속성 문자열의 속성 설정
    attributedStr.addAttribute(NSFontAttributeName, value: UIFont.systemFontOfSize(30), range: NSMakeRange(1, 3))
    let font = UIFont(name: "Marker Felt", size: 25)!
    attributedStr.addAttribute(NSFontAttributeName, value: font, range: NSMakeRange(11, 4))
    attributedStr.addAttributes([NSForegroundColorAttributeName:UIColor.redColor(), NSFontAttributeName:UIFont.systemFontOfSize(25)], range: NSMakeRange(7, 3))
    // 레이블 생성과 속성 문자열 설정
    let attributedTextLabel = UILabel(frame: CGRectMake(50, 400, 200, 40))
    attributedTextLabel.attributedText = attributedStr
    // 뷰 구조에 추가
    self.view.addSubview(attributedTextLabel)
    
    let customFontLabel = UILabel(frame: CGRectMake(50, 450, 300, 40))
    customFontLabel.font = UIFont(name: "SeoulHangang", size: 25)
    customFontLabel.text = "커스텀 폰트를 사용한 레이블"
    self.view.addSubview(customFontLabel)
  }
}

