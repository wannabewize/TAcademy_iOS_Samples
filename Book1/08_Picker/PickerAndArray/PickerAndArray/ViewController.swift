//
//  ViewController.swift
//  PickerAndArray
//
//  Created by wannabewize on 2015. 8. 8..
//  Copyright (c) 2015년 VanillaStep. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
  
  var data : [String]!
  
  func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
    return 1
  }
  
  func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return data.count
  }
  
  func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
    return data[row]
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    data = ["MacBook Air", "MacBook pro", "MacBook Pro Retina", "Mac Mini", "iMac", "Mac Pro", "iPhone", "iPod Touch"]
  }
  
  func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    println("Select : " + data[row])
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

