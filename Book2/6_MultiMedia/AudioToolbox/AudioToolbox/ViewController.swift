//
//  ViewController.swift
//  AudioToolbox
//
//  Created by wannabewize on 2015. 3. 26..
//  Copyright (c) 2015년 wannabewize. All rights reserved.
//

import UIKit
import AudioToolbox

class ViewController: UIViewController {
  var soundId : SystemSoundID = 0
  
  override func viewDidLoad() {
    super.viewDidLoad()
    let url = NSBundle.mainBundle().URLForResource("Hero", withExtension: "aiff")
    
    AudioServicesCreateSystemSoundID(url as CFURLRef, &soundId)
    // Do any additional setup after loading the view, typically from a nib.
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  @IBAction func playSound(sender: AnyObject) {
    AudioServicesPlaySystemSound(soundId)
  }
  
  @IBAction func playVibrator(sender: AnyObject) {
  }
}

