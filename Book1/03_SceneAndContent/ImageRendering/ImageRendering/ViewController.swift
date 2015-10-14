//
//  ViewController.swift
//  ImageRendering
//
//  Created by wannabewize on 2015. 3. 21..
//  Copyright (c) 2015년 wannabewize. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    
    let image = UIImage(named: "CircleCat")
    
    let imageView1 = UIImageView(image: image)
    imageView1.center = self.view.center
    imageView1.center.y = 150
    self.view.addSubview(imageView1)
    
    print("default rendering mode : \(image?.renderingMode)")
    let image1 = image?.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
    
    let imageView2 = UIImageView(image: image1)
    imageView2.center = self.view.center
    imageView2.center.y = 400
    self.view.addSubview(imageView2)
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
}

