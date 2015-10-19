//
//  ViewController.swift
//  SceneChange
//
//  Created by wannabewize on 2015. 3. 23..
//  Copyright (c) 2015년 wannabewize. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBAction func changeScene(sender : AnyObject) {
    let vc = self.storyboard?.instantiateViewControllerWithIdentifier("SCENE_B") as! AnotherViewController
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    let window = appDelegate.window!
    window.rootViewController = vc
  }
}

