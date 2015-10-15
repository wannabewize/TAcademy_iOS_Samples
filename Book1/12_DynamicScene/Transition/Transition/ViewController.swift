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
    // 새로 전환할 뷰 생성
    let newView = UIView()
    newView.frame = currentView.frame
    
    let r = randomColorCode()
    let g = randomColorCode()
    let b = randomColorCode()
    
    newView.backgroundColor = UIColor(red: r, green: g, blue: b, alpha: 1.0)
    
    // 뷰 전환
    UIView.transitionWithView(containerView, duration: 1.0, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: { () -> Void in
      
        self.currentView.removeFromSuperview()
        self.containerView.addSubview(newView)
        self.currentView = newView
      
      }) { (finished : Bool) -> Void in

        print("Transition Done");
    }
    
//    UIView.transitionFromView(currentView, toView: newView, duration: 1.0, options: UIViewAnimationOptions.TransitionFlipFromLeft) { (finished) -> Void in
//      println("transition done")
//    }
  }
  
  func randomColorCode() -> CGFloat {
    return CGFloat(arc4random_uniform(255)) / 255
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

