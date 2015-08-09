//
//  DetailViewController.swift
//  SpotAction
//
//  Created by wannabewize on 2015. 3. 27..
//  Copyright (c) 2015년 wannabewize. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
  var urlStr : String!

  @IBOutlet weak var webView: UIWebView!
  
  override func viewWillAppear(animated: Bool) {
    if let url = NSURL(string: urlStr) {
      let request = NSURLRequest(URL: url)
      webView.loadRequest(request)
    }
  }

  @IBAction func dismissModal(sender: AnyObject) {
    self.dismissViewControllerAnimated(true, completion: nil)
  }
}
