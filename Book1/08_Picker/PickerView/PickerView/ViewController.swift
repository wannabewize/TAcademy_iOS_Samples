//
//  ViewController.swift
//  PickerView
//
//  Created by wannabewize on 2014. 8. 19..
//  Copyright (c) 2014년 VanillaStep. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
  
  func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
    return 2
  }
  func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return 20
    
  }
  func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
    return "C \(component) R \(row)"
  }  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let picker = UIPickerView()
    picker.delegate = self
    picker.dataSource = self
    
    picker.center = self.view.center
    self.view.addSubview(picker)
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
}

