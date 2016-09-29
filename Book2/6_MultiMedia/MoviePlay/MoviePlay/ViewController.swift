//
//  ViewController.swift
//  MoviePlay
//
//  Created by wannabewize on 2015. 3. 27..
//  Copyright (c) 2015년 wannabewize. All rights reserved.
//

import UIKit
import MediaPlayer
import AVKit

class ViewController: UIViewController {
   @IBOutlet weak var containerView: UIView!
   
   @IBAction func playLocalMovie(sender: AnyObject) {
      // 기존의 뷰 삭제
      for v in containerView.subviews {
         v.removeFromSuperview()
      }
      
      let url = NSBundle.mainBundle().URLForResource("movie", withExtension: "mov")!
      let player = AVPlayer(URL: url)
      
      let avPlayer = AVPlayerViewController()
      avPlayer.player = player
      
      avPlayer.view.frame = containerView.frame
      containerView.addSubview(avPlayer.view)
      
      player.play()
   }
   
   // MPMoviePlayerController - deprecated 9.0
   var moviePlayer : MPMoviePlayerController!
   @IBAction func playLocalMovie2(sender : AnyObject) {
      // 기존의 뷰 삭제
      for v in containerView.subviews {
         v.removeFromSuperview()
      }
      moviePlayer = nil
      
      let url = NSBundle.mainBundle().URLForResource("movie", withExtension: "mov")
      moviePlayer = MPMoviePlayerController(contentURL: url)
      
      moviePlayer.view.frame = containerView.frame
      containerView.addSubview(moviePlayer.view)
      
      moviePlayer.play()
   }
   
   @IBAction func showInfo(sender: AnyObject) {
      print("natural size : \(moviePlayer.naturalSize)")
      print("duration : \(moviePlayer.duration)")
      print("playable Duration : \(moviePlayer.playableDuration)")
      print("movieMediaTypes : \(moviePlayer.movieMediaTypes)")
      print("movieSourceType : \(moviePlayer.movieSourceType.rawValue)")
   }
   
   @IBAction func playStream(sender: AnyObject) {
      // 기존의 뷰 삭제
      for v in containerView.subviews {
         v.removeFromSuperview()
      }
      moviePlayer = nil
      
      let urlStr = "https://devimages.apple.com.edgekey.net/streaming/examples/bipbop_16x9/bipbop_16x9_variant.m3u8"
      let url = NSURL(string: urlStr)
      
      // 스트리밍 동영상 주소를 이용해서 재생기 생성
      moviePlayer = MPMoviePlayerController(contentURL: url)
      
      moviePlayer.view.frame = containerView.frame
      containerView.addSubview(moviePlayer.view)
      
      moviePlayer.play()
      print("동영상 재생 길이 : \(moviePlayer.duration)")
   }
   
   override func viewWillAppear(animated: Bool) {
      NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ViewController.handleMovieDurationNoti(_:)), name: MPMovieDurationAvailableNotification, object: nil)
   }
   
   func handleMovieDurationNoti(noti : NSNotification) {
      let player = noti.object as! MPMoviePlayerController
      print("동영상 재생 길이 알림, 재생 길이 : \(player.duration)")
   }
}

