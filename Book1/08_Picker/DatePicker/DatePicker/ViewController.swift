//
//  ViewController.swift
//  DatePicker
//
//  Created by wannabewize on 2015. 3. 18..
//  Copyright (c) 2015년 VanillaStep. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    
    // 데이트 피커 객체 생성
    let datePicker = UIDatePicker()
    // 위치
    datePicker.center = self.view.center
    // 날짜/시간 선택 모드
    datePicker.datePickerMode = UIDatePickerMode.DateAndTime
    
    // 일주일 전 ~ 일주일 후
    let week : NSTimeInterval = 60 * 60 * 24 * 7
    datePicker.minimumDate = NSDate(timeIntervalSinceNow: -week)
    datePicker.maximumDate = NSDate(timeIntervalSinceNow: week)
    
    // 뷰 구조에 추가
    self.view.addSubview(datePicker)
    
    // 날짜 변경 이벤트
    datePicker.addTarget(self, action: Selector("timeChanged:"), forControlEvents: UIControlEvents.ValueChanged)
  }
  
func timeChanged(sender : AnyObject) {
  let datePicker = sender as! UIDatePicker
  let date = datePicker.date
  
  // 데이트 포매터
  let dateFormatter = NSDateFormatter()
  dateFormatter.dateStyle = NSDateFormatterStyle.ShortStyle
  dateFormatter.timeStyle = NSDateFormatterStyle.ShortStyle
  
  // 날짜 형식에 맞는 문자열 얻기
  let dateStr = dateFormatter.stringFromDate(date)
  println("선택한 날짜 : \(dateStr)")
}

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

