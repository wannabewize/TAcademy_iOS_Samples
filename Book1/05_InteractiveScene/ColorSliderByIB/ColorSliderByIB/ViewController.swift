//
//  ViewController.swift
//  ColorSliderByIB
//
//  Created by wannabewize on 2014. 8. 21..
//  Copyright (c) 2014년 VanillaStep. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  @IBOutlet weak var colorView: UIView!
  // 3색 슬라이더의 아웃렛 연결
  @IBOutlet weak var redSlider: UISlider!
  @IBOutlet weak var greenSlider: UISlider!
  @IBOutlet weak var blueSlider: UISlider!
  
  // 파라미터가 필요없는 액션 메소드
  // 3색 슬라이더의 ValueChanged 이벤트와 연결
  @IBAction func colorChanged() {
    let r = redSlider.value
    let g = greenSlider.value
    let b = blueSlider.value
    let color = UIColor(red: CGFloat(r), green: CGFloat(g), blue: CGFloat(b), alpha: 1)
    colorView.backgroundColor = color
  }
  
  // 스위치의 ValueChanged 이벤트와 연결
  @IBAction func switchChanged(sender: UISwitch) {
    redSlider.enabled = sender.on
    greenSlider.enabled = sender.on
    blueSlider.enabled = sender.on
    if sender.on {
      colorChanged()
    } else {
      colorView.backgroundColor = UIColor.grayColor()
    }
  }
  
  // 씬이 나타나면서 기본 설정값 반영
  override func viewWillAppear(animated: Bool) {
    colorChanged()
  }
}

