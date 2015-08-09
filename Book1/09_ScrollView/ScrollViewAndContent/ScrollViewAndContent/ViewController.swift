//
//  ViewController.swift
//  ScrollViewAndContent
//
//  Created by wannabewize on 2015. 3. 19..
//  Copyright (c) 2015년 wannabewize. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

  var imageView: UIImageView!
  @IBOutlet weak var scrollView: UIScrollView!
  
  // 임의의 위치로 스크롤
  @IBAction func scrollToRandom(sender: AnyObject) {
    
    // 컨텐츠 사이즈 내 임의의 위치 얻기
    let x = arc4random_uniform( UInt32(scrollView.contentSize.width - scrollView.frame.size.width) )
    let y = arc4random_uniform( UInt32(scrollView.contentSize.height - scrollView.frame.size.height) )
    
    // 난수를 이용해서 새로운 컨텐츠 오프셋으로 이동
    let contentOffset = CGPointMake(CGFloat(x), CGFloat(y))
    scrollView.setContentOffset(contentOffset, animated: true)
  }
  
  // 2배 확대
  @IBAction func scaleDouble(sender: AnyObject) {
    scrollView.setZoomScale(2.0, animated: true)
  }
  
  @IBAction func fitToHeight(sender: AnyObject) {
    let ratio = scrollView.frame.size.height / imageView.image!.size.height
    scrollView.setZoomScale(ratio, animated: true)
  }
  
  // 확대/축소를 위한 스크롤뷰의 델리게이트 메소드
  func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
    return imageView
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let image = UIImage(named:"image.jpg")!
    imageView = UIImageView(image: image)
    scrollView.addSubview(imageView)
    scrollView.contentSize = image.size
    
    scrollView.minimumZoomScale = scrollView.frame.size.width / image.size.width
    scrollView.maximumZoomScale = 2.0 // 2대 확대
  }
}

