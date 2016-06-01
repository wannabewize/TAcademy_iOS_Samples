//
//  ViewController.swift
//  ActivityIndicatorSwitch
//
//  Created by wannabewize on 2014. 8. 22..
//  Copyright (c) 2014년 VanillaStep. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   // 액티비티 인디케이터의 아웃렛
   @IBOutlet weak var indicator: UIActivityIndicatorView!
   // 스위치의 ValueChanged의 액션 메소드
   @IBAction func switchChanged(sender: AnyObject) {
      let onOffSwitch = sender as! UISwitch
      if onOffSwitch.on {
         indicator.startAnimating()
      }
      else {
         indicator.stopAnimating()
      }
   }
}

