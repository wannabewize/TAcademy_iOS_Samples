//
//  ViewController.swift
//  CodeSnippet
//
//  Created by wannabewize on 2015. 3. 25..
//  Copyright (c) 2015년 wannabewize. All rights reserved.
//

import UIKit

class Catalog {
  class var defaultCatalog : Catalog {
    return Catalog()
  }
  
  func searchProduct(keyword : String){}
}

class ViewController: UIViewController, NSURLConnectionDataDelegate, NSURLConnectionDelegate, UISearchBarDelegate {
  
  func searchBarSearchButtonClicked(searchBar: UISearchBar) {
    let keyword = searchBar.text
    
    Catalog.defaultCatalog.searchProduct(keyword)
  }
  
  func test() {
    let urlStr = "http://www.ibiblio.org/wm/paint/auth/munch/munch.scream.jpg"
    let url = NSURL(string: urlStr)!
    let request = NSURLRequest(URL: url)
    
//    var response : NSURLResponse?
//    var error : NSError?
//    let data = NSURLConnection.sendSynchronousRequest(request, returningResponse: &response, error: &error)
//    println("동기 방식으로 리소스 얻기 : \(data?.length)")
//    
//
//    NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) { (reponse : NSURLResponse!, data : NSData!, error : NSError!) -> Void in
//      println("비동기 방식으로 리소스 얻어오기 : \(data.length)")
//    }
    
    NSURLConnection(request: request, delegate: self)
  }
  
  func testJson() {
    let url = NSBundle.mainBundle().URLForResource("json", withExtension: "txt")!
    let data = NSData(contentsOfURL: url)!
    var error : NSError?
    
    let ret = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions(0), error: &error) as! NSDictionary
    
    let version = (ret["version"] as! NSNumber).integerValue
    println("version : \(version)")
  }
  
  func testJson2() {
    let url = NSBundle.mainBundle().URLForResource("json2", withExtension: "txt")!
    let data = NSData(contentsOfURL: url)!
    var error : NSError?
    
    let ret = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions(0), error: &error) as! NSDictionary
    
    let devices = ret["device"] as! NSArray
    let device = devices[2] as! String
    
    println("device : \(device)")
  }
  
  func testJson3() {
    let url = NSBundle.mainBundle().URLForResource("json3", withExtension: "txt")!
    let data = NSData(contentsOfURL: url)!
    var error : NSError?
    
    let ret = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions(0), error: &error) as! NSDictionary
    
  let spec = ret["device"]?[0]?["spec"] as! NSDictionary
  let size = spec["screen"] as! String
  
  println("screen : \(size)")
  }
  
  var buffer = NSMutableData()
  
  func connection(connection: NSURLConnection, didReceiveData data: NSData) {
    buffer.appendData(data)
    println("did received data : \(data.length)")
  }
  
  func connectionDidFinishLoading(connection: NSURLConnection) {
    // 이미지 다운로드 완료. 버퍼에서 이미지 생성
    let image = UIImage(data: buffer)
    println("connectionDidFinishLoading")
  }
  
  func openAPI() {
    let appKey = ""
    var keyword = ""
    let urlStr = "http://apis.skplanetx.com/11st/common/products?appKey=\(appKey)&format=json&count=&page=&searchKeyword=\(keyword)&sortCode=&option=&version=1"
    let encoded = urlStr.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)
  }
  
  override func viewWillAppear(animated: Bool) {
//    test()
    testJson()
    testJson2()
    testJson3()
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

