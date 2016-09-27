//
//  ViewController.swift
//  DownloadTask
//
//  Created by wannabewize on 2016. 9.
//  Copyright © 2016년 VanillaStep. All rights reserved.
//

import UIKit

class ViewController: UIViewController, NSURLSessionDelegate, NSURLSessionTaskDelegate, NSURLSessionDownloadDelegate {
   
   @IBOutlet weak var imageView: UIImageView!
   
   
   let urlStr =  "https://upload.wikimedia.org/wikipedia/commons/f/f4/The_Scream.jpg" // 4mb
   
   
   func URLSessionDidFinishEventsForBackgroundURLSession(session: NSURLSession) {
      print("URLSessionDidFinishEventsForBackgroundURLSession")
      
      let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
      
      if let completionHandler = appDelegate.backgroundSessionCompletionHandler {
         appDelegate.backgroundSessionCompletionHandler = nil
         completionHandler()
      }
   }
   
   func URLSession(session: NSURLSession, downloadTask: NSURLSessionDownloadTask, didFinishDownloadingToURL location: NSURL) {
      print("didFinishDownloadingToURL : ", location)
      
      if let data = NSData(contentsOfURL: location) {
         self.imageView.image = UIImage(data:data)
      }
   }
   
   // DownloadTask 결과
   func URLSession(session: NSURLSession, downloadTask: NSURLSessionDownloadTask, didResumeAtOffset fileOffset: Int64, expectedTotalBytes: Int64) {
      print("didResumeAtOffset")
   }
   
   func URLSession(session: NSURLSession, downloadTask: NSURLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
      print("Progress : \(Float(totalBytesWritten) / Float(totalBytesExpectedToWrite) * 100)")
   }
   

   @IBAction func foregroundDownload() {
      imageView.image = nil
      NSURLCache.sharedURLCache().removeAllCachedResponses()
      
      print("Download Image foreground")
      
      if let url = NSURL(string: urlStr) {
         // Foreground 다운로드 용 세션
         let config = NSURLSessionConfiguration.defaultSessionConfiguration()
         let session = NSURLSession(configuration: config)
         
         session.downloadTaskWithURL(url, completionHandler: { (downloaded : NSURL?, response : NSURLResponse?, error : NSError?) in
            if error != nil {
               print("Error : ", error?.localizedDescription)
               return
            }
            
            print("Downloaded : ", downloaded!.path)
            NSOperationQueue.mainQueue().addOperationWithBlock({
               if let data = NSData(contentsOfURL: downloaded!) {
                  self.imageView.image = UIImage(data:data)
               }
            })
         }).resume()
      }
   }
   
   
   
   @IBAction func backgroundDownload() {
      imageView.image = nil
      NSURLCache.sharedURLCache().removeAllCachedResponses()
      
      if let url = NSURL(string: urlStr) {
         
         // 백그라운드 다운로드 용 세션 - delegate 사용해야 한다.
         let config = NSURLSessionConfiguration.backgroundSessionConfigurationWithIdentifier("vanillastepdev.background.example.IMAGE_DOWNLOAD")
         let session = NSURLSession(configuration: config, delegate: self, delegateQueue: NSOperationQueue.mainQueue())
         
         session.downloadTaskWithURL(url).resume()
      }
   }
}

