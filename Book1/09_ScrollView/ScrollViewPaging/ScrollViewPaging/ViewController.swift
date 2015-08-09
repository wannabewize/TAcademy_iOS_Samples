//
//  ViewController.swift
//  ScrollViewPaging
//
//  Created by wannabewize on 2015. 3. 19..
//  Copyright (c) 2015년 wannabewize. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

  @IBOutlet weak var scrollView: UIScrollView!
  
  @IBOutlet weak var pageControl: UIPageControl!
  
  let pageCount = 4
  // 중복 로딩 방지
  var lastLoadingPage : Int = -1
  
  override func viewDidLayoutSubviews() {
    // 스크롤 뷰의 실제 크기는 - 제약조건이 적용된 이후에 얻을 수 있다.
    let pageSize = scrollView.frame.size
    
    // 4페이지로 되도록 컨텐츠 크기 설정
    scrollView.contentSize = CGSizeMake( pageSize.width * CGFloat(pageCount), pageSize.height)
    loadContentPage(0)
    loadContentPage(1)
    
//    // 1번째 페이지
//    let image1 = UIImage(named:"image0.jpg")
//    let imageView1 = UIImageView(image: image1)
//    imageView1.frame = CGRectMake(pageSize.width * 0, 0, pageSize.width, pageSize.height)
//    scrollView.addSubview(imageView1)
//    
//    // 2번째 페이지
//    let image2 = UIImage(named: "image1.jpg")
//    let imageView2 = UIImageView(image: image2)
//    imageView2.frame = CGRectMake(pageSize.width * 1, 0, pageSize.width, pageSize.height)
//    scrollView.addSubview(imageView2)
//
//    // 3번째 페이지
//    let image3 = UIImage(named: "image2.jpg")
//    let imageView3 = UIImageView(image: image3)
//    imageView3.frame = CGRectMake(pageSize.width * 2, 0, pageSize.width, pageSize.height)
//    scrollView.addSubview(imageView3)
//
//    // 4번째 페이지
//    let image4 = UIImage(named: "image3.jpg")
//    let imageView4 = UIImageView(image: image4)
//    imageView4.frame = CGRectMake(pageSize.width * 3, 0, pageSize.width, pageSize.height)
//    scrollView.addSubview(imageView4)
  }
  
  func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
    let pageIndex = Int( floor(scrollView.contentOffset.x / scrollView.frame.size.width) )
    pageControl.currentPage = pageIndex
    println("pageIndex : \(pageIndex)")
    
    // 전-후까지 3 페이지 준비
    loadContentPage(pageIndex-1)
    loadContentPage(pageIndex)
    loadContentPage(pageIndex+1)
  }
  
  func loadContentPage(pageIndex : Int) {
    if pageIndex < pageCount && pageIndex > lastLoadingPage {
      println("loading : \(pageIndex)")
      // 해당 페이지의 이미지 얻기
      let fileName = "image\(pageIndex).jpg"
      let image = UIImage(named:fileName)
      
      let imageView = UIImageView(image: image)
      let pageSize = scrollView.frame.size
      imageView.frame = CGRectMake(pageSize.width * CGFloat(pageIndex), 0, pageSize.width, pageSize.height)
      
      scrollView.addSubview(imageView)
      
      lastLoadingPage = pageIndex
    }
  }

  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    scrollView.pagingEnabled = true
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

