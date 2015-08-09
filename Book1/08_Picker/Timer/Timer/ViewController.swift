//
//  ViewController.swift
//  Timer
//
//  Created by wannabewize on 2015. 3. 18..
//  Copyright (c) 2015년 wannabewize. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  var timer : NSTimer!
  @IBOutlet weak var pickerView: UIDatePicker!
  @IBAction func startTimer(sender: AnyObject) {
    let interval : NSTimeInterval = 1
    timer = NSTimer.scheduledTimerWithTimeInterval(interval, target: self, selector: Selector("countDown:"), userInfo: nil, repeats: true)
  }
  
  @IBAction func stopTimer(sender: AnyObject) {
    if timer != nil {
      timer.invalidate()
      timer = nil
    }
  }
  func countDown(timer : NSTimer) {
    pickerView.countDownDuration -= 60
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

