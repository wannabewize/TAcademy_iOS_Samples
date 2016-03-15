//
//  ViewController.swift
//  PagingScene
//
//  Created by wannabewize on 2016. 3. 16..
//  Copyright © 2016년 VanillaStep. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
   
   @IBOutlet weak var pageController: UIPageControl!

   @IBOutlet weak var containerView: UIView!
   
   // Page 계산하기
   func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
      let page = Int(scrollView.contentOffset.x / scrollView.frame.size.width)
      print("Page Changed : ", page)
      pageController.currentPage = page
   }
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      pageController.numberOfPages = 4
   }

   override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
   }
}

