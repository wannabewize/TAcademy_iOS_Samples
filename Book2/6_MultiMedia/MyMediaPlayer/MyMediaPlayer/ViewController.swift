//
//  ViewController.swift
//  MediaPicker
//
//  Created by wannabewize on 2015. 3. 27..
//  Copyright (c) 2015년 wannabewize. All rights reserved.
//

import UIKit
import MediaPlayer

class ViewController: UIViewController, MPMediaPickerControllerDelegate, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
   
   @IBOutlet weak var tableView: UITableView!
   @IBOutlet weak var progressView: UIProgressView!
   
   var player : MPMusicPlayerController!
   
   var mediaList = [MPMediaItem]()
   
   // 미디어 검색
   func searchBarSearchButtonClicked(searchBar: UISearchBar) {
      let keyword = searchBar.text
      searchBar.resignFirstResponder()
      
      
      // 미디어 쿼리
      let query = MPMediaQuery()
      // 검색 조건
      let predicate = MPMediaPropertyPredicate(value: keyword, forProperty: MPMediaItemPropertyTitle, comparisonType: MPMediaPredicateComparison.Contains)
      query.addFilterPredicate(predicate)
      
      // 결과
      mediaList = query.items!
      self.tableView.reloadData()
      
      // 플레이어 큐에 쿼리 결과
      player.setQueueWithQuery(query)
      player.play()
   }
   
   // 미디어 선택
   @IBAction func pickMedia(sender: AnyObject) {
      let picker = MPMediaPickerController(mediaTypes: MPMediaType.Music)
      picker.delegate = self
      picker.allowsPickingMultipleItems = true
      self.showViewController(picker, sender: sender)
   }
   
   func mediaPicker(mediaPicker: MPMediaPickerController, didPickMediaItems mediaItemCollection: MPMediaItemCollection) {
      // 사용자가 선택한 미디어
      self.mediaList = mediaItemCollection.items
      mediaPicker.dismissViewControllerAnimated(true, completion: nil)
      
      tableView.reloadData()
      
      // 플레이어 큐에 선태 결과 설정
      player.setQueueWithItemCollection(mediaItemCollection)
      player.play()
   }
   
   // 취소 혹은 선택하지 않고 완료
   func mediaPickerDidCancel(mediaPicker: MPMediaPickerController) {
      mediaPicker.dismissViewControllerAnimated(true, completion: nil)
   }
   
   func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
   }
   
   // 테이블 뷰
   func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return mediaList.count
   }
   
   func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCellWithIdentifier("MEDIA_CELL", forIndexPath: indexPath)
      
      let media = mediaList[indexPath.row]
      
      if let title = media.valueForProperty(MPMediaItemPropertyTitle) as? String {
         cell.textLabel?.text = title
      }
      
      if let album = media.valueForProperty(MPMediaItemPropertyAlbumTitle) as? String {
         cell.detailTextLabel?.text = album
      }
      
      if let artwork = media.valueForProperty(MPMediaItemPropertyArtwork) as? MPMediaItemArtwork {
         let image = artwork.imageWithSize(CGSizeMake(60, 60))
         cell.imageView?.image = image
         
      }
      return cell
   }
   
   override func viewWillAppear(animated: Bool) {
      NSNotificationCenter.defaultCenter().addObserver(self, selector: "handlePlaybackChange:", name: MPMusicPlayerControllerPlaybackStateDidChangeNotification , object: nil)
   }
   
   @IBAction func stop(sender: AnyObject) {
      player.stop()
   }
   
   @IBAction func play(sender: AnyObject) {
      player.play()
   }
   
   var timer : NSTimer!
   func handlePlaybackChange(noti : NSNotification) {
      let info = noti.userInfo!
      print("info \(info)")
      
      if let v = info["MPMusicPlayerControllerPlaybackStateKey"] as? Int,
         let state = MPMusicPlaybackState(rawValue: v) {
            switch state {
            case .Stopped, .Paused:
               if timer != nil {
                  timer.invalidate()
               }
            case .Playing:
               timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "handleTimer:", userInfo: nil, repeats: true)
               print("Playing")
            default:
               print("Other")
            }
      }
   }
   
   func handleTimer(timer : NSTimer) {
      if player.nowPlayingItem != nil {
         // 현재 재생 시간
         let playbackTime = player.currentPlaybackTime
         
         // 재생 중인 노래의 전체 길이
         let item : MPMediaItem = player.nowPlayingItem!
         let duration = item.valueForProperty(MPMediaItemPropertyPlaybackDuration) as! Int
         
         // 진행도 설정
         let progress = Float(playbackTime) / Float(duration)
         progressView.progress = progress
      }
   }
   
   override func viewDidLoad() {
      super.viewDidLoad()
      player = MPMusicPlayerController.applicationMusicPlayer()
      player.beginGeneratingPlaybackNotifications()
   }
}


