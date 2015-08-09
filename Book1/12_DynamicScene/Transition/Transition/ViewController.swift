//
//  ViewController.swift
//  Transition
//
//  Created by wannabewize on 2015. 3. 19..
//  Copyright (c) 2015년 wannabewize. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var containerView: UIView!
  
  @IBOutlet weak var currentView: UIView!
  
  @IBAction func startTransition(sender: AnyObject) {
    let newView = UIView()
    newView.frame = currentView.frame
    newView.backgroundColor = UIColor.blueColor()
    
    UIView.transitionWithView(containerView, duration: 1.0, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: { () -> Void in
      
        self.currentView.removeFromSuperview()
        self.containerView.addSubview(newView)
      
      }) { (finished : Bool) -> Void in
        println("Transition Done");
    }
    
//    UIView.transitionFromView(currentView, toView: newView, duration: 1.0, options: UIViewAnimationOptions.TransitionFlipFromLeft) { (finished) -> Void in
//      println("transition done")
//    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

