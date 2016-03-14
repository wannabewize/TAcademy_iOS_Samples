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
      
      // 반투명 이미지
      
      let image = UIImage(named: "opaque")
      
      let imageView1 = UIImageView(image: image)
      imageView1.center = CGPointMake(100, 150)
      self.view.addSubview(imageView1)
      
      print("default rendering mode : \(image?.renderingMode)")
      let image1 = image?.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
      
      let imageView2 = UIImageView(image: image1)
      imageView2.center = CGPointMake(260, 150)
      self.view.addSubview(imageView2)
      
      
      // 배경 투명 이미지
      
      let image2 = UIImage(named: "transparent")
      let imageView3 = UIImageView(image: image2)
      imageView3.center = CGPointMake(100, 350)
      self.view.addSubview(imageView3)
      
      let image3 = image2?.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
      let imageView4 = UIImageView(image: image3)
      imageView4.center = CGPointMake(260, 350)
      self.view.addSubview(imageView4)
   }
   
   override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
   }
}

