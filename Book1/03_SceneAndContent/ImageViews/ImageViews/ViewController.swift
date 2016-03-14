//
//  ViewController.swift
//  ImageViews
//
//  Created by wannabewize on 2015. 1. 26..
//  Copyright (c) 2015년 VanillaStep. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
   // 스토리보드의 이미지 뷰와 아웃렛으로 연결
   @IBOutlet weak var imageView1: UIImageView!
   @IBOutlet weak var imageView2: UIImageView!
   // 코드로 생성할 이미지 뷰 프로퍼티
   var imageView3 : UIImageView!
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      // 파일 이름으로 이미지 생성
      let image1 = UIImage(named: "cat1.png")
      imageView1.image = image1
      
      // 파일 경로에서 이미지 생성. nil 체크 필요
      let filePath = NSBundle.mainBundle().pathForResource("cat2", ofType: "png")!
      let image2 = UIImage(contentsOfFile: filePath)
      imageView2.image = image2
      
      // 인터넷에서 이미지 다운로드. nil체크 필요
      let urlStr = "http://lorempixel.com/600/300/cats/"
      if let imageUrl = NSURL(string: urlStr),
         let imageData = NSData(contentsOfURL: imageUrl){
         let image3 = UIImage(data: imageData)
         // 이미지 뷰를 코드로 생성
         imageView3 = UIImageView(frame: CGRectMake(50, 350, 200, 100))
         imageView3.image = image3
         self.view.addSubview(imageView3)
      }
   }
}

