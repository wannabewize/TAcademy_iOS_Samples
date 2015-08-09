//
//  ViewController.swift
//  NumberUpAndDown
//
//  Created by wannabewize on 2014. 8. 22..
//  Copyright (c) 2014년 VanillaStep. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  // 레이블 아웃렛
  @IBOutlet weak var label: UILabel!
  // 슬라이더 아웃렛
  @IBOutlet weak var slider: UISlider!
  // 스테퍼 아웃렛
  @IBOutlet weak var stepper: UIStepper!
  
  // 스테퍼 변경
  @IBAction func stepperChanged(sender: AnyObject) {
    let v = Int(stepper.value)
    label.text = "\(v)"
    slider.value = Float(v)
  }
  
  // 슬라이더 변경
  @IBAction func sliderChanged(sender: AnyObject) {
    let v = Int(slider.value)
    label.text = "\(v)"
    slider.value = Float(v)
    stepper.value = Double(v)
  }
}

