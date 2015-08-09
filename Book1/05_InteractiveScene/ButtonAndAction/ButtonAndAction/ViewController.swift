//
//  ViewController.swift
//  ButtonAndAction
//
//  Created by wannabewize on 2015. 1. 26..
//  Copyright (c) 2015년 VanillaStep. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var colorView: UIView!
  
  @IBAction func changeRed(sender: AnyObject) {
    colorView.backgroundColor = UIColor.redColor()
  }
  
  @IBAction func changeGreen(sender: AnyObject) {
    colorView.backgroundColor = UIColor.greenColor()
  }
  
  @IBAction func changeBlue(sender: AnyObject) {
    colorView.backgroundColor = UIColor.blueColor()
  }
}

