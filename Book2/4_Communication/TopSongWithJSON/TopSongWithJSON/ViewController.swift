//
//  ViewController.swift
//  TopSongWithJSON
//
//  Created by wannabewize on 2015. 3. 26..
//  Copyright (c) 2015년 wannabewize. All rights reserved.
//

import UIKit

struct SongInfo {
  var title : String?
  var image : String?
  var artist : String?
  init() {}
}

class ViewController: UIViewController, UITableViewDataSource {
  let urlStr = "http://ax.itunes.apple.com/WebObjects/MZStoreServices.woa/ws/RSS/topsongs/limit=25/json"
  
  var songList = [SongInfo]()
  @IBOutlet weak var tableView: UITableView!
  
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
        let data = NSData(contentsOfURL: url)!
        let image = UIImage(data: data)!
        cell.imageView?.image = image
      }
    }
    return cell
  }
  
  func parseJSON() {
    let url = NSURL(string: urlStr)!
    let data = NSData(contentsOfURL: url)!
    var error : NSError?
    
    // JSON 파싱
    let result = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions(0), error: &error) as! NSDictionary
    // JSON 구조를 따라서 정보 찾기
    if let feed = result["feed"] as? NSDictionary {
      if let entry = feed["entry"] as? NSArray {
        for one in entry {
          var song = SongInfo()
          
          let title = (one["title"] as! NSDictionary)["label"] as! String
          song.title = title
          
          let images = one["im:image"] as! NSArray
          if let image = (images[0] as! NSDictionary)["label"] as? String {
            song.image = image
          }
          
          songList.append(song)
        }
        tableView.reloadData()
      }
    }
  }
  
  override func viewWillAppear(animated: Bool) {
    parseJSON()
  }
}

