//
//  ViewController.swift
//  NaviBasedApp
//
//  Created by wannabewize on 2015. 3. 24..
//  Copyright (c) 2015년 VanillaStep. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBAction func showSecond1(sender: AnyObject) {
    self.performSegueWithIdentifier("PUSH_SEUGE", sender: sender)
  }

  @IBAction func showSecond2(sender: AnyObject) {
    let vc = self.storyboard!.instantiateViewControllerWithIdentifier("SECOND_VC")
    self.navigationController?.pushViewController(vc, animated: true)
    
//    self.showViewController(vc, sender: sender)
  }
}

