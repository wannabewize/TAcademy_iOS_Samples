//
//  ViewController.swift
//  UserDefault
//
//  Created by wannabewize on 2015. 3. 26..
//  Copyright (c) 2015년 VanillaStep. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var birthdayPicker: UIDatePicker!
  @IBOutlet weak var notiSwitch: UISwitch!
  
  @IBAction func saveSetting(sender: AnyObject) {
    let setting = NSUserDefaults.standardUserDefaults()
    
    setting.setObject(birthdayPicker.date, forKey: "BIRTHDAY")
    setting.setBool(notiSwitch.on, forKey: "NOTI")
    
    // 저장
    setting.synchronize()
  }
  
  @IBAction func restoreSetting(sender: AnyObject) {
    let setting = NSUserDefaults.standardUserDefaults()
    
    birthdayPicker.date = setting.objectForKey("BIRTHDAY") as! NSDate
    notiSwitch.on = setting.boolForKey("NOTI")
  }
}

