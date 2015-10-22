//
//  ViewController.swift
//  Sensor
//
//  Created by wannabewize on 2015. 4. 3..
//  Copyright (c) 2015년 wannabewize. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
  
  var manager : CMMotionManager!
  
  @IBAction func startMesuring() {
    if manager == nil {
      manager = CMMotionManager()
    }
    
    manager.startAccelerometerUpdatesToQueue(NSOperationQueue.mainQueue()) { (data : CMAccelerometerData?, error : NSError?) -> Void in

      let x = data!.acceleration.x
      let y = data!.acceleration.y
      let z = data!.acceleration.z
      
      print("x : \(x) y : \(y) z : \(z)")
    }
    
    manager.startGyroUpdatesToQueue(NSOperationQueue.mainQueue()) { (data : CMGyroData?, error : NSError?) -> Void in
      let x = data!.rotationRate.x
      let y = data!.rotationRate.y
      let z = data!.rotationRate.z
      
      print("x : \(x) y : \(y) z : \(z)")
    }
  }

  override func viewDidLoad() {
    super.viewDidLoad()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

