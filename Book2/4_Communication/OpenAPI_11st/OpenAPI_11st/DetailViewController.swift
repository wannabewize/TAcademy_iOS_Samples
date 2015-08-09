//
//  DetailViewController.swift
//  OpenAPI_11st
//
//  Created by wannabewize on 2015. 2. 11..
//  Copyright (c) 2015년 VanillaStep. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
  var productCode : Int?
  @IBOutlet weak var webView: UIWebView!
  
  override func viewWillAppear(animated: Bool) {
    if let product = Model.sharedModel.productWithCode(productCode!) {
      if let url = NSURL(string:product.detailUrl!) {
        let request = NSURLRequest(URL: url)
        webView.loadRequest(request)
      }
    }
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
  /*
  // MARK: - Navigation
  
  // In a storyboard-based application, you will often want to do a little preparation before navigation
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
  // Get the new view controller using segue.destinationViewController.
  // Pass the selected object to the new view controller.
  }
  */
  
}
