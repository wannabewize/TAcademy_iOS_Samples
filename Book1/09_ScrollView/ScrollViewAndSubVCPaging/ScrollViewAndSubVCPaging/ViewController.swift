//
//  ViewController.swift
//  ScrollViewAndSubVCPaging
//
//  Created by wannabewize on 2015. 3. 22..
//  Copyright (c) 2015년 wannabewize. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

//  @IBOutlet weak var containerView: UIView!
  @IBOutlet weak var scrollView: UIScrollView!
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }
  
  override func viewDidLayoutSubviews() {

    scrollView.contentSize = CGSizeMake(scrollView.frame.size.width * 4, scrollView.frame.size.height)
    
//    containerView.setNeedsLayout()
//    scrollView.contentSize = containerView.frame.size
    print("== viewDidLayoutSubviews ==")
    print("scrollView size : \(scrollView.frame.size)")
//    containerView.setNeedsLayout()
//    println("containerView : \(containerView.frame.size)")
    
    let vc1 = storyboard!.instantiateViewControllerWithIdentifier("ContentVC")
    vc1.title = "VC1"
    vc1.view.backgroundColor = UIColor.redColor()
    let vc2 = storyboard!.instantiateViewControllerWithIdentifier("ContentVC")
    vc2.title = "VC2"
    vc2.view.backgroundColor = UIColor.greenColor()
    let vc3 = storyboard!.instantiateViewControllerWithIdentifier("ContentVC")
    vc3.title = "VC3"
    vc3.view.backgroundColor = UIColor.blueColor()
    let vc4 = storyboard!.instantiateViewControllerWithIdentifier("ContentVC")
    vc4.title = "VC4"
    vc4.view.backgroundColor = UIColor.grayColor()
    
    let size = scrollView.frame.size
    vc1.view.frame.origin = CGPointMake(size.width * 0, 0)
    vc2.view.frame.origin = CGPointMake(size.width * 1, 0)
    vc3.view.frame.origin = CGPointMake(size.width * 2, 0)
    vc4.view.frame.origin = CGPointMake(size.width * 3, 0)
    
    scrollView.addSubview(vc1.view)
    scrollView.addSubview(vc2.view)
    scrollView.addSubview(vc3.view)
    scrollView.addSubview(vc4.view)
  }
  
  override func viewDidAppear(animated: Bool) {
    print("== viewDidAppear ==")
//    println("containerView : \(containerView.frame.size)")
    print("scrollView' contentSize : \(scrollView.contentSize)")
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

