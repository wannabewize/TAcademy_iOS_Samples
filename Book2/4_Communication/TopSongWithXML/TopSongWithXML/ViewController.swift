//
//  ViewController.swift
//  TopSongWithXML
//
//  Created by wannabewize on 2014. 8. 28..
//  Copyright (c) 2014년 VanillaStep. All rights reserved.
//

import UIKit

struct SongInfo {
  var title : String?
  var image : String?
  var artist : String?
  init() {}
}

class ViewController: UIViewController, NSXMLParserDelegate, UITableViewDataSource {
  let urlStr = "http://ax.itunes.apple.com/WebObjects/MZStoreServices.woa/ws/RSS/topsongs/limit=25/xml"

  var songList = [SongInfo]()
  var interestingTag = false
  var currentSong : SongInfo!
  var bufferStr = ""
  
  @IBOutlet weak var tableView: UITableView!
  
  func parserDidStartDocument(parser: NSXMLParser) {
    println("XML 파싱 시작")
  }
  
  func parser(parser: NSXMLParser, parseErrorOccurred parseError: NSError) {
    println("XML 파싱 에러")
  }
  
  func parserDidEndDocument(parser: NSXMLParser) {
    tableView.reloadData()
    println("XML 파싱 끝")
  }
  
  func parser(parser: NSXMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [NSObject : AnyObject]) {
//    println("didStartElement elementName : \(elementName) namespace : \(namespaceURI) qualifedName \(qName)")
    if "entry" == elementName {
      currentSong = SongInfo()
    }
    else if "title" == elementName {
      interestingTag = true
    }
    // 이미지
    else if ("im:image" == elementName && attributeDict["height"] as! String == "55") {
      println("image tag!")
      interestingTag = true
    }
  }
  
  func parser(parser: NSXMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
    if "entry" == elementName {
      songList.append(currentSong)
      currentSong = nil
    }
    // title 태그는 entry 외부에도 존재
    else if "title" == elementName && currentSong != nil {
      currentSong.title = bufferStr
    }
    else if "im:image" == elementName && interestingTag {
      currentSong.image = bufferStr
    }
    bufferStr = ""
    interestingTag = false
  }
  
  func parser(parser: NSXMLParser, foundCharacters string: String?) {
    if interestingTag {
      bufferStr = bufferStr + string!
    }
  }
  
  // XML 파싱
  func parseXML() {
    let url = NSURL(string: urlStr)
    let parser = NSXMLParser(contentsOfURL: url)!
    parser.delegate = self
    parser.parse()
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return songList.count
  }
  
  // 이미지 캐쉬
  var imageCache = [NSURL : UIImage]()
  var operationQueue = NSOperationQueue()
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    var cell = tableView.dequeueReusableCellWithIdentifier("SongCell", forIndexPath: indexPath) as! UITableViewCell
    let one = songList[indexPath.row]
    cell.textLabel!.text = one.title
    println("\(indexPath.row) image \(one.image)")
    // 이미지 경로가 있으면
    if let urlStr = one.image {
      if let url = NSURL(string: urlStr) {

      let tmpImage = UIImage(named: "placeholder.png")
      cell.imageView?.setImageWithURL(url, placeholderImage: tmpImage)
      }
    }
    return cell
  }
  
  override func viewWillAppear(animated: Bool) {
    parseXML()
  }
  
  override func viewDidLoad() {
    NSURLCache.sharedURLCache().removeAllCachedResponses()
  }
}

