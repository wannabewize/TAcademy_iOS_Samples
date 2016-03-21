//
//  ViewController.swift
//  WebKitSample
//
//  Created by wannabewize on 2016. 3. 21..
//  Copyright © 2016년 VanillaStep. All rights reserved.
//

import UIKit
import WebKit
import SafariServices

class ViewController: UIViewController, WKNavigationDelegate {
   
   var webView : WKWebView!
   
   func webView(webView: WKWebView, didCommitNavigation navigation: WKNavigation!) {
      print("didCommitNavigation")
   }
   
   func webView(webView: WKWebView, didFailNavigation navigation: WKNavigation!, withError error: NSError) {
      print("Fail : \(error)")
   }

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
      
      
      let webItem = UIBarButtonItem(title: "Web", style:UIBarButtonItemStyle.Plain, target: self, action: "showWebPage")
      let fileItem = UIBarButtonItem(title: "File", style: UIBarButtonItemStyle.Plain, target: self, action: "showFileContent")
      let strItem = UIBarButtonItem(title: "Str", style: UIBarButtonItemStyle.Plain, target: self, action: "showStrContent")
      let sfItem = UIBarButtonItem(title: "Safari", style: UIBarButtonItemStyle.Plain, target: self, action: "ShowSF")
      toolbar.setItems([webItem, fileItem, strItem, sfItem], animated: false)
   }
   
   func showFileContent() {
      if let url = NSBundle.mainBundle().URLForResource("localHtml", withExtension: "html") {
         webView.loadFileURL(url, allowingReadAccessToURL: url)
      }
   }
   
   func showWebPage() {
      let urlStr = "http://apple.com/"
      if let url = NSURL(string: urlStr) {
         let req = NSURLRequest(URL: url)
         let ret = webView.loadRequest(req)
         print(ret)
      }
      else {
         print("URL Error : ", urlStr)
      }
   }
   
   func showStrContent() {
      let htmlStr = "<html><body><h1>Content From String</h1></body></html>"
      webView.loadHTMLString(htmlStr, baseURL: nil)
   }
   
   func ShowSF() {
      let urlStr = "https://developer.apple.com/library"
      if let url = NSURL(string: urlStr) {
         let safariVC = SFSafariViewController(URL: url)
         self.showViewController(safariVC, sender: nil)
      }
   }
}

