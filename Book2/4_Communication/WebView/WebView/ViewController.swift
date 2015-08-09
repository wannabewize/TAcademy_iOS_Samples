//
//  ViewController.swift
//  WebView
//
//  Created by wannabewize on 2015. 3. 27..
//  Copyright (c) 2015년 wannabewize. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate {
  @IBOutlet weak var textField: UITextField!
  @IBOutlet weak var webView: UIWebView!

  // 엔터로 웹뷰 로딩
  @IBAction func didEndOnExit(sender: AnyObject) {
    // http를 입력해야 한다.
    let urlStr = textField.text
    if let url = NSURL(string: urlStr) {
      let request = NSURLRequest(URL: url)
      webView.loadRequest(request)
    }
  }
  
  func webViewDidFinishLoad(webView: UIWebView) {
    println("로딩 완료!")
  }
  
  func webView(webView: UIWebView, didFailLoadWithError error: NSError) {
    // 에러 처리
    println("에러!")
  }
}

