//
//  ViewController.swift
//  SessionAndTask
//
//  Created by wannabewize on 2016. 3. 22..
//  Copyright © 2016년 VanillaStep. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   @IBOutlet weak var imageView: UIImageView!
   @IBAction func downloadData(sender: AnyObject) {
   let urlStr = "http://lorempixel.com/800/600/cats/"
   if let url = NSURL(string: urlStr) {
      let config = NSURLSessionConfiguration.defaultSessionConfiguration()
      let session = NSURLSession(configuration: config)

      let task = session.dataTaskWithURL(url, completionHandler: { (data : NSData?, response : NSURLResponse?, error : NSError?) -> Void in
         if error != nil {
            print("Error : ", error)
            return
         }
         
         if let imageData = data {
            // 메인 쓰레드에서 UI 업데이트
            NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
               self.imageView.image = UIImage(data: imageData)
            })
         }
         else {
            print("Image Data nil")
         }
      })
      task.resume()
   }
   }
   
   @IBAction func downloadFile(sender: AnyObject) {
      let urlStr = "http://lorempixel.com/800/600/cats/"
      if let url = NSURL(string: urlStr) {
         let request = NSURLRequest(URL: url)
         let config = NSURLSessionConfiguration.defaultSessionConfiguration()
         let session = NSURLSession(configuration: config)
         
         let task = session.downloadTaskWithRequest(request, completionHandler: { (fileUrl : NSURL?, response : NSURLResponse?, error : NSError?) -> Void in
            if error != nil {
               print("Error : ", error)
               return
            }
            
            print("Image Download Success : \(fileUrl)")

         })
         task.resume()
      }
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

