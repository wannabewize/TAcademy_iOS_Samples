//
//  ViewController.swift
//  WebKitSample
//
//  Created by wannabewize on 2016. 3. 21..
//  Copyright © 2016년 VanillaStep. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
   
   var webView : WKWebView!

   override func viewDidLoad() {
      super.viewDidLoad()
      
      let toolbar = UIToolbar()
      self.view.addSubview(toolbar)
      
      webView = WKWebView()
      self.view.addSubview(webView)
      
      webView.navigationDelegate = self
      

      
      // Layout
      toolbar.translatesAutoresizingMaskIntoConstraints = false
      webView.translatesAutoresizingMaskIntoConstraints = false
      
      view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("|[toolbar]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["toolbar":toolbar]))
      view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:[topGuide]-[toolbar][webView]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["topGuide":self.topLayoutGuide,"toolbar":toolbar, "webView":webView]))
      view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("|[webView]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["webView":webView]))
      
      
      let appleItem = UIBarButtonItem(title: "Apple", style:UIBarButtonItemStyle.Plain, target: self, action: "showApple")
      let googleItem = UIBarButtonItem(title: "Google", style:UIBarButtonItemStyle.Plain, target: self, action: "showGoogle")
      let fileItem = UIBarButtonItem(title: "File", style: UIBarButtonItemStyle.Plain, target: self, action: "showFileContent")
      toolbar.setItems([appleItem, googleItem, fileItem], animated: false)
   }
   
   func showApple() {
      showWebPage("http://apple.com")
   }
   
   func showGoogle() {
      showWebPage("http://google.com")
   }
   
   func showFileContent() {
      if let url = NSBundle.mainBundle().URLForResource("localHtml", withExtension: "html") {
         webView.loadFileURL(url, allowingReadAccessToURL: url)
      }
   }
   
   func showWebPage(urlStr : String) {
      print("loading : ", urlStr)
      if let url = NSURL(string: urlStr) {
         let req = NSURLRequest(URL: url)
         webView.loadRequest(req)
      }
      else {
         print("URL Error : ", urlStr)
      }
   }
   
   

   override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
   }


}

