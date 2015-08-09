//
//  Model.swift
//  OpenAPI_11st
//
//  Created by wannabewize on 2015. 2. 11..
//  Copyright (c) 2015년 VanillaStep. All rights reserved.
//

import UIKit

struct Product {
  var code : Int?
  var name : String?
  var image : String?
  var price : Int?
  var detailUrl : String?
}

let SearchProductFinishNotification = "SearchProductFinishNotification";

class Model: NSObject {
  var productList = [Product]()
  
  func productWithCode(code : Int) -> Product? {
    for product in productList {
      if product.code == code {
        return product
      }
    }
    return nil
  }
  
  func numberOfProduct() -> Int {
    return productList.count
  }
  
  func productAt(index : Int) -> Product {
    return productList[index]
  }
  
  let API_KEY = "a8c097aa-ac4d-39c6-9f8f-7361784230e0"
  func searchProduct(keyword : String) {
    productList.removeAll(keepCapacity: false)
    
    let urlStr = "http://apis.skplanetx.com/11st/common/products?count=&page=&searchKeyword=\(keyword)&sortCode=&option=&version=1&format=json&appKey=\(API_KEY)"
    println("Search product : \(urlStr)")
    let encoded = urlStr.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)!
    
    if let url = NSURL(string: encoded) {
      let request = NSURLRequest(URL: url)
      NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue(), completionHandler: { (response : NSURLResponse!, data : NSData!, error : NSError!) -> Void in
        // 비동기, 멀티 쓰레드
        println("is Main Thread : \(NSThread.isMainThread())")
        var error : NSError?
        let result = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions(0), error: &error) as! NSDictionary
        println("parsing result : \(result)")
        let response = result["ProductSearchResponse"] as! NSDictionary
        let products = response["Products"]?["Product"] as! NSArray
        for one in products {
          let product = one as! NSDictionary
          let code = product["ProductCode"] as? Int
          let image = product["ProductImage"] as? String
          let name = product["ProductName"] as? String
          let price = product["ProductPrice"] as? Int
          let detailUrl = product["DetailPageUrl"] as? String
          println("code : \(code) name : \(name) price : \(price) detail : \(detailUrl)")
          let one = Product(code: code, name: name, image: image, price: price, detailUrl:detailUrl)
          self.productList.append(one)
        }
        NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
          NSNotificationCenter.defaultCenter().postNotificationName(SearchProductFinishNotification, object: nil)
        })        
      })
    }
  }
  
  func resolveDetailInfo(code : Int) {
    
    
  }
  
  class var sharedModel : Model {
    struct Instance {
      static var instance : Model?
    }
    if Instance.instance == nil {
      Instance.instance = Model()
    }
    return Instance.instance!
  }
}
