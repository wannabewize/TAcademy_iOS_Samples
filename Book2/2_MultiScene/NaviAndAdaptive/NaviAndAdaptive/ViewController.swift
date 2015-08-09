//
//  ViewController.swift
//  NaviAndAdaptive
//
//  Created by wannabewize on 2015. 3. 30..
//  Copyright (c) 2015년 wannabewize. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  @IBAction func showSecond(sender: AnyObject) {
    let vc = self.storyboard?.instantiateViewControllerWithIdentifier("SecondVC") as! UIViewController
    self.showViewController(vc, sender: sender)
    self.tabBarController
    
  }

  @IBAction func pushSecond(sender: AnyObject) {
    let vc = self.storyboard?.instantiateViewControllerWithIdentifier("SecondVC") as! UIViewController
    self.navigationController?.pushViewController(vc, animated: true)
    
  }
}

