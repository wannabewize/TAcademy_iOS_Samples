//
//  ViewController.swift
//  RequestAndResponse
//
//  Created by wannabewize on 2016.
//  Copyright © 2016년 VanillaStep. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
   @IBOutlet var resultView : UITextView!

   override func viewDidLoad() {
      super.viewDidLoad()
      // Do any additional setup after loading the view, typically from a nib.
   }

   override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
   }
   
   override func viewDidAppear(animated: Bool) {
   }
   
   // Timeout
   @IBAction func sendDelayRequest() {
      resultView.text = ""
      // 10초 지연 응답
      if let url = NSURL(string: "https://httpbin.org/delay/10") {
         let request = NSMutableURLRequest(URL: url)
         
         // TIMEOUT을 5초로
         request.timeoutInterval = 5
         
         let session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration() )
         
         session.dataTaskWithRequest(request, completionHandler: { (body : NSData?, response : NSURLResponse?, error : NSError?) in
            print("Main Thread?",NSThread.isMainThread())
            
            NSOperationQueue.mainQueue().addOperationWithBlock({ 
               self.resultView.text.appendContentsOf("Error : \(error)\n")
               self.resultView.text.appendContentsOf("Response : \(response)\n")
               self.resultView.text.appendContentsOf("Body : \(body)\n")
            })
         }).resume()
      }
   }
   
   @IBAction func sendErrorRequest() {
      resultView.text = nil
      if let url = NSURL(string: "https://httpbin.org/status/400") {
         let request = NSURLRequest(URL: url)
         
         let session = NSURLSession.init(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
         session.dataTaskWithRequest(request, completionHandler: { (body : NSData?, response : NSURLResponse?, error : NSError?) in
            
            NSOperationQueue.mainQueue().addOperationWithBlock({ 
               if let res = response as? NSHTTPURLResponse {
                  self.resultView.text.appendContentsOf("Response : \(res.statusCode)\n")
                  self.resultView.text.appendContentsOf("MIME Type : \(res.MIMEType)\n")
                  self.resultView.text.appendContentsOf("Content-Type : \(res.allHeaderFields["Content-Type"])\n")
                  self.resultView.text.appendContentsOf("Content-Length : \(res.allHeaderFields["Content-Length"])\n")
               }
               
               self.resultView.text.appendContentsOf("Error : \(error)\n")
               self.resultView.text.appendContentsOf("Body : \(body)\n")
            })
         }).resume()
      }
   }
}

