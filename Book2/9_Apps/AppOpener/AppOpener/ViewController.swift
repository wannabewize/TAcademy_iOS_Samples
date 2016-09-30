//
//  ViewController.swift
//  AppOpener
//
//  Created by Jaehoon Lee on 2016. 9. 30..
//  Copyright © 2016년 Jaehoon Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   @IBOutlet weak var textField1: UITextField!
   @IBOutlet weak var textField2: UITextField!
   
   @IBAction func openOtherApp(sender: AnyObject) {
      
      let urlComponent = NSURLComponents(string: "myScheme://com.vanillastep/")!
      // 퍼센트 인코딩도 해준다.
      let query1 = NSURLQueryItem(name: "value1", value: textField1.text)
      let query2 = NSURLQueryItem(name: "value2", value: textField2.text)
      
      urlComponent.queryItems = [query1, query2]
      
      let url = urlComponent.URL!
      
      if UIApplication.sharedApplication().canOpenURL(url) {
         UIApplication.sharedApplication().openURL(url)
      }
      else {
         print("Can not open")
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

