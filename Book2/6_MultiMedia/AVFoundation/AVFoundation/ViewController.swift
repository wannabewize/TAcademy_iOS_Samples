//
//  ViewController.swift
//  AVFoundation
//
//  Created by wannabewize on 2015. 3. 27..
//  Copyright (c) 2015년 wannabewize. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController, AVAudioPlayerDelegate, UITableViewDataSource, UITableViewDelegate {
  
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var artworkImageView: UIImageView!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var artistLabel: UILabel!
  @IBOutlet weak var durationLabel: UILabel!
  @IBOutlet weak var timeSlider: UISlider!
  
  var musicList : [NSURL]!
  var player : AVAudioPlayer!
  var timer : NSTimer!
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return musicList.count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("MUSIC_CELL", forIndexPath: indexPath) as! UITableViewCell
    cell.textLabel?.text = "Music \(indexPath.row)"
    return cell
  }
  
  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    let url = musicList[indexPath.row]
    showMusicInfo(url)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    musicList = [NSBundle.mainBundle().URLForResource("music1", withExtension: "mp3")!,
      NSBundle.mainBundle().URLForResource("music2", withExtension: "mp3")!,
      NSBundle.mainBundle().URLForResource("music3", withExtension: "mp3")!]
  }
  
  
  
  
  @IBAction func togglePlay(sender: AnyObject) {
    if player != nil && player.playing {
      if timer != nil {
        timer.invalidate()
      }
      
      // 재생 버튼의 제목 변경
      let button = sender as! UIButton
      button.setTitle("재생", forState: UIControlState.Normal)
      
      player.stop()
    }
    else {
      // 현재 선택된 셀을 재생
      var selected : Int = 0
      if let index = tableView.indexPathForSelectedRow() {
        selected = index.row
      }
      
      // 선택된 음악의 재생기 생성
      let url = musicList[selected]
      var error : NSError?
      player = AVAudioPlayer(contentsOfURL: url, error: &error)
      player.delegate = self
      
      // 음악 재생과 타이머 실행
      player.play()
      timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "handleTimer:", userInfo: nil, repeats: true)
      
      // 재생 버튼의 제목 변경
      let button = sender as! UIButton
      button.setTitle("중지", forState: UIControlState.Normal)
      
      // 슬라이더의 최대값 설정
      timeSlider.maximumValue = Float(player.duration)
      
      // 음악 전체 길이
      let min = Int(player.duration / 60)
      let sec = Int(player.duration % 60)
      durationLabel.text = String(format: "%2d:%2d", min, sec)
      
      // 음악 정보 출력
      showMusicInfo(url)
    }
  }
  
  // 음악 정보 출력
  func showMusicInfo(url : NSURL) {
    let asset = AVAsset.assetWithURL(url) as! AVAsset
    let metadata = asset.commonMetadata
    
    let titles = AVMetadataItem.metadataItemsFromArray(metadata, withKey: AVMetadataCommonKeyTitle, keySpace: AVMetadataKeySpaceCommon)
    if titles != nil && titles.count > 0 {
      let item = titles[0] as! AVMetadataItem
      titleLabel.text = item.stringValue
    }
    
    let artists = AVMetadataItem.metadataItemsFromArray(metadata, withKey: AVMetadataCommonKeyArtist, keySpace: AVMetadataKeySpaceCommon)
    if artists != nil && artists.count > 0 {
      let item = artists[0] as! AVMetadataItem
      artistLabel.text = item.stringValue
    }
    
    let artworks = AVMetadataItem.metadataItemsFromArray(metadata, withKey: AVMetadataCommonKeyArtwork, keySpace: AVMetadataKeySpaceCommon)
    if artworks != nil && artworks.count > 0 {
      let item = artworks[0] as! AVMetadataItem
      let data = item.value as! NSData
      let image = UIImage(data: data)
      artworkImageView.image = image
    }
  }
  
  func handleTimer(timer : NSTimer) {
    timeSlider.value = Float(player.currentTime)
  }
  
  // 슬라이더 이벤트
  @IBAction func timeSliderTouchUp(sender: AnyObject) {
    if player != nil {
      timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "handleTimer:", userInfo: nil, repeats: true)
    }
  }
  
  @IBAction func timeSliderTouchDown(sender: AnyObject) {
    if timer != nil {
      timer.invalidate()
    }
  }
  
  @IBAction func timeSliderChanged(sender: AnyObject) {
    let slider = sender as! UISlider
    if player != nil {
      player.currentTime = NSTimeInterval(slider.value)
    }
  }
  
  // Test Method
  func playMusic() {
    let url = NSBundle.mainBundle().URLForResource("music1", withExtension: "mp3")
    var error : NSError?
    player = AVAudioPlayer(contentsOfURL: url, error: &error)
    player.delegate = self
    if player.prepareToPlay() {
      player.play()
    }
    
    // AVAsset 객체 생성
    let asset = AVAsset.assetWithURL(url) as! AVAsset
    
    // 공통 메타 데이터
    let metadata = asset.commonMetadata
    // 제목 얻기
    let titles = AVMetadataItem.metadataItemsFromArray(metadata, withKey: AVMetadataCommonKeyTitle, keySpace: AVMetadataKeySpaceCommon)
    let item = titles[0] as! AVMetadataItem
    let title = item.stringValue
    
    println("제목 : \(title)")
  }
}

