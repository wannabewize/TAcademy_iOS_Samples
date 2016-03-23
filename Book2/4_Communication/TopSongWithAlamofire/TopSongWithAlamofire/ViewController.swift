//
//  ViewController.swift
//  TopSongWithAlamofire
//
//  Created by wannabewize on 2016. 3. 24..
//  Copyright © 2016년 VanillaStep. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

struct SongInfo {
   var title : String!
   var image : String!
   var artist : String!
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
   
   let urlStr = "http://ax.itunes.apple.com/WebObjects/MZStoreServices.woa/ws/RSS/topsongs/limit=25/json"
   var loadingImage : UIImage!
   
   var songList = [SongInfo]()
   
   @IBOutlet weak var tableView: UITableView!
   
   func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return songList.count
   }
   
   func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCellWithIdentifier("SongCell", forIndexPath: indexPath)
      let one = songList[indexPath.row]
      cell.textLabel!.text = one.title

      if let urlStr = one.image,
         let url = NSURL(string: urlStr) {
            cell.imageView?.af_setImageWithURL(url, placeholderImage: loadingImage, filter: nil, imageTransition: UIImageView.ImageTransition.CrossDissolve(0.3), runImageTransitionIfCached: true, completion: nil)
      }
      return cell
   }

   func parseJSON() {
      Alamofire.request(.GET, urlStr).responseJSON { (response : Response<AnyObject, NSError>) -> Void in
         if let root = response.result.value as? NSDictionary,
            let feed = root["feed"] as? NSDictionary,
            let entry = feed["entry"] as? [NSDictionary] {
               for one in entry {
                  var song = SongInfo()

                  let title = (one["title"] as! NSDictionary)["label"] as! String
                  song.title = title

                  let images = one["im:image"] as! NSArray
                  if let image = (images[0] as! NSDictionary)["label"] as? String {
                     song.image = image
                  }
                  
                  self.songList.append(song)
               }
               self.tableView.reloadData()
         }
      }
   }
   
   override func viewWillAppear(animated: Bool) {
      parseJSON()
   }
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      loadingImage = UIImage(named: "loading")!
   }
}

