//
//  SecondViewController.swift
//  NaviBasedApp
//
//  Created by wannabewize on 2015. 3. 24..
//  Copyright (c) 2015년 VanillaStep. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
  
  // 코드를 이용해서 뒤로 가기
  @IBAction func backToFirst(sender: AnyObject) {
    self.navigationController?.popViewControllerAnimated(true)
  }
}
