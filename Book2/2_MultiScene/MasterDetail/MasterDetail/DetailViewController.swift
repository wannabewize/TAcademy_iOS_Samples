//
//  DetailViewController.swift
//  MasterDetail
//
//  Created by wannabewize on 2015. 3. 24..
//  Copyright (c) 2015년 VanillaStep. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
  
  var urlStr : String!

  @IBOutlet weak var webView: UIWebView!
  
  override func viewWillAppear(animated: Bool) {
    if let url = NSURL(string: "http://\(urlStr)") {
      let request = NSURLRequest(URL: url)
      self.webView.loadRequest(request)
    }
    else {
      println("URL 에러")
    }
  }
}
