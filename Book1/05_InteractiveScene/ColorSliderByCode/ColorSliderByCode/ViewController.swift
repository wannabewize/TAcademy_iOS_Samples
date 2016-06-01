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
      powerSwitch.addTarget(self, action: #selector(switchChanged(_:)), forControlEvents: UIControlEvents.ValueChanged)
      self.view.addSubview(powerSwitch)
      
      colorView = UIView()
      self.view.addSubview(colorView)
      
      // 빨간색 레이블과 슬라이더
      let redLabel = UILabel()
      redLabel.textColor = UIColor.redColor()
      redLabel.text = "Red"
      
      redSlider = UISlider()
      redSlider.addTarget(self, action: #selector(colorChanged), forControlEvents: UIControlEvents.ValueChanged)
      
      let redStackView = UIStackView(arrangedSubviews: [redLabel, redSlider])
      redLabel.setContentHuggingPriority(UILayoutPriorityRequired, forAxis: .Horizontal)
      redSlider.setContentHuggingPriority(0, forAxis: .Horizontal)
      redStackView.alignment = .Fill
      redStackView.distribution = .FillProportionally
      redStackView.spacing = 10
      
      // 녹색 레이블과 슬라이더
      let greenLabel = UILabel()
      greenLabel.textColor = UIColor.greenColor()
      greenLabel.text = "Green"
      
      greenSlider = UISlider()
      greenSlider.addTarget(self, action: #selector(colorChanged), forControlEvents: UIControlEvents.ValueChanged)
      
      let greenStackView = UIStackView(arrangedSubviews: [greenLabel, greenSlider])
      greenLabel.setContentHuggingPriority(UILayoutPriorityRequired, forAxis: .Horizontal)
      greenStackView.spacing = 10
      greenStackView.distribution = .FillProportionally
      greenStackView.alignment = .Fill
      
      
      // 파란색 레이블과 슬라이더
      let blueLabel = UILabel()
      blueLabel.textColor = UIColor.blueColor()
      blueLabel.text = "Blue"
      
      blueSlider = UISlider()
      blueSlider.addTarget(self, action: #selector(colorChanged), forControlEvents: UIControlEvents.ValueChanged)
      
      let blueStackView = UIStackView(arrangedSubviews: [blueLabel, blueSlider])
      blueLabel.setContentHuggingPriority(UILayoutPriorityRequired, forAxis: .Horizontal)
      blueStackView.spacing = 10
      blueStackView.distribution = .FillProportionally
      blueStackView.alignment = .Fill
      
      let controllerStackView = UIStackView(arrangedSubviews: [redStackView, greenStackView, blueStackView])
      controllerStackView.axis = .Vertical
      controllerStackView.spacing = 10
      controllerStackView.alignment = .Fill
      controllerStackView.distribution = .FillEqually
      
      self.view.addSubview(controllerStackView)
      
      
      let views : [String : AnyObject] = ["topGuide":self.topLayoutGuide, "switch":powerSwitch, "colorView":colorView, "controller":controllerStackView]
      
      // 스위치 - 가로 제약조건
      powerSwitch.translatesAutoresizingMaskIntoConstraints = false
      let constraintsSwitch = NSLayoutConstraint.constraintsWithVisualFormat("[switch]-|", options: [], metrics: nil, views: views)
      self.view.addConstraints(constraintsSwitch)
      
      colorView.translatesAutoresizingMaskIntoConstraints = false
      let constraintsColorView = NSLayoutConstraint.constraintsWithVisualFormat("|-[colorView]-|", options: [], metrics: nil, views: views)
      self.view.addConstraints(constraintsColorView)
      
      controllerStackView.translatesAutoresizingMaskIntoConstraints = false
      let constraintsController = NSLayoutConstraint.constraintsWithVisualFormat("|-[controller]-|", options: [], metrics: nil, views: views)
      self.view.addConstraints(constraintsController)
      
      let constraintsVertical = NSLayoutConstraint.constraintsWithVisualFormat("V:[topGuide]-[switch]-[colorView(200)]-[controller(200)]", options: [], metrics: nil, views: views)
      self.view.addConstraints(constraintsVertical)
      
      
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

