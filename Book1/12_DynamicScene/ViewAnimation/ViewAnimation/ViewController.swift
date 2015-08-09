//
//  ViewController.swift
//  ViewAnimation
//
//  Created by wannabewize on 2015. 3. 19..
//  Copyright (c) 2015년 wannabewize. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var block: UIView!

  
  @IBAction func moveBlock(sender: AnyObject) {
    UIView.animateWithDuration(1.0, animations: { () -> Void in
      let width = self.view.frame.size.width - self.block.frame.size.width
      let height = self.view.frame.height - self.block.frame.height - 44
      
      let x = arc4random_uniform(UInt32(width))
      let y = arc4random_uniform(UInt32(height))
      
      self.block.center = CGPointMake(CGFloat(x), CGFloat(y))
    })
  }
  
  @IBAction func scaleBlock(sender: AnyObject) {
    UIView.animateWithDuration(1.0, animations: { () -> Void in
      let length = arc4random_uniform(200) + 100
      
      self.block.frame.size = CGSizeMake(CGFloat(length), CGFloat(length));
    })
  }
  
  @IBAction func animateMulti(sender: AnyObject) {
    // do it!
    
    UIView.animateWithDuration(1.0, animations: { () -> Void in
      let width = self.view.frame.size.width - self.block.frame.size.width
      let height = self.view.frame.height - self.block.frame.height - 44
      
      let x = arc4random_uniform(UInt32(width))
      let y = arc4random_uniform(UInt32(height))
      
      self.block.center = CGPointMake(CGFloat(x), CGFloat(y))
      
      }) { (finished : Bool
        ) -> Void in
        UIView.animateWithDuration(1.0, animations: { () -> Void in
          let length = arc4random_uniform(200) + 100
          
          self.block.frame.size = CGSizeMake(CGFloat(length), CGFloat(length));
        })
    }
  }
}

