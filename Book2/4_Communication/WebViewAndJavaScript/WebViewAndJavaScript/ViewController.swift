//
//  ViewController.swift
//  WebViewAndJavaScript
//
//  Created by wannabewize on 2015. 7. 8..
//  Copyright (c) 2015년 VanillaStep. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var webView: UIWebView!
  @IBAction func executeScript(sender: AnyObject) {
    let script = "alert('Works!')"
    webView.stringByEvaluatingJavaScriptFromString(script)

  }
  
  override func viewWillAppear(animated: Bool) {
    let url = NSURL(string: "http://apple.com")!
    let request = NSURLRequest(URL: url)
    webView.loadRequest(request);
  }
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

