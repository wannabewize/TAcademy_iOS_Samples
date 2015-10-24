//
//  ViewController.swift
//  SyncAndAsync
//
//  Created by wannabewize on 2015. 1. 8..
//  Copyright (c) 2015년 VanillaStep. All rights reserved.
//

import UIKit

class ViewController: UIViewController, NSURLConnectionDelegate, NSURLConnectionDataDelegate {
   // 이미지 뷰의 아웃렛
   @IBOutlet weak var imageView: UIImageView!
   let urlStr = "http://upload.wikimedia.org/wikipedia/commons/4/4d/Klimt_-_Der_Kuss.jpeg"
   
   @IBOutlet weak var indicator: UIActivityIndicatorView!
   
   @IBAction func handleSync(sender: AnyObject) {
      imageView.image = nil
      
      // 인디케이터 시작 - 그러나 동작하지 않는다.
      indicator.startAnimating()
      
      let url = NSURL(string: urlStr)!
      
      // NSData에서 바로 로딩
      //      let data = NSData(contentsOfURL: url)!
      
      let request = NSURLRequest(URL: url)
      var response : NSURLResponse?
      do {
         let data = try NSURLConnection.sendSynchronousRequest(request, returningResponse: &response)
         let image = UIImage(data: data)
         imageView.image = image
      }
      catch {
         print("이미지 로딩 에러")
      }
      
      indicator.stopAnimating()
   }
   
   
   @IBAction func handleASync(sender: AnyObject) {
      imageView.image = nil
      
      // 인디케이터 시작
      indicator.startAnimating()
      
      let url = NSURL(string: urlStr)!
      let request = NSMutableURLRequest(URL: url)
      
      // 이미지를 화면에 반영하려면 메인 쓰레드에서
      let queue = NSOperationQueue.mainQueue()
      NSURLConnection.sendAsynchronousRequest(request, queue: queue) { (response : NSURLResponse?, data : NSData?, error : NSError?) -> Void in
         if nil != error {
            print("Error : \(error)")
            return
         }
         let image = UIImage(data: data!)
         self.imageView.image = image
         print("is Main thread? \(NSThread.isMainThread())")
         // 인디케이터 중지
         self.indicator.stopAnimating()
      }
   }
   
   // Delegate를 사용하는 방식
   var buffer : NSMutableData! // 버퍼
   @IBAction func handleAsync2(sender: AnyObject) {
      imageView.image = nil
      buffer = NSMutableData()
      
      // 인디케이터 시작
      indicator.startAnimating()
      
      let url = NSURL(string: urlStr)!
      let request = NSMutableURLRequest(URL: url)
      
      NSURLConnection(request: request, delegate: self)
   }
   
   func connection(connection: NSURLConnection, didFailWithError error: NSError) {
      print("Error : \(error.localizedDescription)")
   }
   
   func connection(connection: NSURLConnection, didReceiveData data: NSData) {
      print("didReceiveData : \(data.length)")
      buffer.appendData(data)
   }
   
   func connectionDidFinishLoading(connection: NSURLConnection) {
      let image = UIImage(data: buffer!)
      self.imageView.image = image
      
      self.indicator.stopAnimating()
   }
   
   
   @IBAction func handleTask(sender: AnyObject) {
      imageView.image = nil
      
      let url = NSURL(string: urlStr)!
      let session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
      
      let task = session.dataTaskWithURL(url, completionHandler: { (data : NSData?, response : NSURLResponse?, error : NSError?) -> Void in
         if nil != error {
            print("Error : \(error)")
            return
         }
         
         print("isMainThread ? \(NSThread.isMainThread()) data size : \(data!.length)")
         NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
            let image = UIImage(data: data!)
            self.imageView.image = image
            self.indicator.stopAnimating()
         })
      })
      
      self.indicator.startAnimating()
      task.resume()
   }
}

