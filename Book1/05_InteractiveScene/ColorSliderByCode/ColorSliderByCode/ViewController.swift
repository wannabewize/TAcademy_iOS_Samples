//
//  ViewController.swift
//  ColorSliderByCode
//
//  Created by wannabewize on 2014. 8. 21..
//  Copyright (c) 2014년 VanillaStep. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  var colorView: UIView!
  
  var redSlider: UISlider!
  var greenSlider: UISlider!
  var blueSlider: UISlider!
  
  // 3색 슬라이더의 타겟-액션 메소드. ValueChanged 이벤트와 연결
  func colorChanged() {
    let r = CGFloat(redSlider.value)
    let g = CGFloat(greenSlider.value)
    let b = CGFloat(blueSlider.value)
    let color = UIColor(red: r, green: g, blue: b, alpha: 1)
    colorView.backgroundColor = color
  }
  
  // 스위치의 Target-Action 메소드. ValueChanged 이벤트와 연결
  func switchChanged(sender: UISwitch) {
    redSlider.enabled = sender.on
    greenSlider.enabled = sender.on
    blueSlider.enabled = sender.on
    if sender.on {
      colorChanged()
    } else {
      colorView.backgroundColor = UIColor.grayColor()
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // 스위치
    let powerSwitch = UISwitch();
    powerSwitch.frame.origin = CGPointMake(250, 20)
    powerSwitch.addTarget(self, action: "switchChanged:", forControlEvents: UIControlEvents.ValueChanged)
    self.view.addSubview(powerSwitch)
    
    colorView = UIView(frame: CGRectMake(20, 60, 280, 200))
    self.view.addSubview(colorView)
    
    // 빨간색 레이블과 슬라이더
    let redLabel = UILabel(frame: CGRectMake(20, 300, 60, 40))
    redLabel.textColor = UIColor.redColor()
    redLabel.text = "Red"
    self.view.addSubview(redLabel)
    
    redSlider = UISlider(frame: CGRectMake(70, 300, 230, 31))
    self.view.addSubview(redSlider)
    redSlider.addTarget(self, action: "colorChanged", forControlEvents: UIControlEvents.ValueChanged)
    
    // 녹색 레이블과 슬라이더
    let greenLabel = UILabel(frame: CGRectMake(20, 350, 60, 40))
    greenLabel.textColor = UIColor.greenColor()
    greenLabel.text = "Green"
    self.view.addSubview(greenLabel)
    
    greenSlider = UISlider(frame: CGRectMake(70, 350, 230, 31))
    self.view.addSubview(greenSlider)
    greenSlider.addTarget(self, action: Selector("colorChanged"), forControlEvents: UIControlEvents.ValueChanged)
    
    // 파란색 레이블과 슬라이더
    let blueLabel = UILabel(frame: CGRectMake(20, 400, 60, 40))
    blueLabel.textColor = UIColor.blueColor()
    blueLabel.text = "Blue"
    self.view.addSubview(blueLabel)
    
    blueSlider = UISlider(frame: CGRectMake(70, 400, 230, 31))
    self.view.addSubview(blueSlider)
    blueSlider.addTarget(self, action: Selector("colorChanged"), forControlEvents: UIControlEvents.ValueChanged)
    
    // 3색 슬라이더 초기값
    redSlider.value = 0.3
    greenSlider.value = 0.6
    blueSlider.value = 0.9
  }
  
  // 씬이 나타나면서 기본 설정값 반영
  override func viewWillAppear(animated: Bool) {
    colorChanged()
  }
}

