//
//  ViewController.swift
//  MoviePlay
//
//  Created by wannabewize on 2015. 3. 27..
//  Copyright (c) 2015년 wannabewize. All rights reserved.
//

import UIKit
import MediaPlayer

class ViewController: UIViewController {
  @IBOutlet weak var containerView: UIView!
  
  var moviePlayer : MPMoviePlayerController!
  @IBAction func playLocalMovie(sender : AnyObject) {
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
    /*
    NSLog(@"===== Movie Info ===========");
    NSLog(@"naturalSize : %@", NSStringFromCGSize(self.player.naturalSize));
    NSLog(@"duration : %f", self.player.duration);
    NSLog(@"playableDuration : %f", self.player.playableDuration);
    NSLog(@"movieMediaTypes : %d", (int)self.player.movieMediaTypes);
    NSLog(@"movieSourceType : %d", (int)self.player.movieSourceType);
    */
    println("natural size : \(moviePlayer.naturalSize)")
    println("duration : \(moviePlayer.duration)")
    println("playable Duration : \(moviePlayer.playableDuration)")
    println("movieMediaTypes : \(moviePlayer.movieMediaTypes)")
    println("movieSourceType : \(moviePlayer.movieSourceType.rawValue)")
  }
  
  @IBAction func playStream(sender: AnyObject) {
    // 기존의 뷰 삭제
    for v in containerView.subviews {
      v.removeFromSuperview()
    }
    moviePlayer = nil
    
    // 스트리밍 동영상 주소를 이용해서 재생기 생성
    
  }
//  func play2() {
//    let url = NSBundle.mainBundle().URLForResource("movie", withExtension: "mp4")
//    let vc = MPMoviePlayerViewController(contentURL: url)
//    self.presentMoviePlayerViewControllerAnimated(vc)
//    
//  }
  
  override func viewWillAppear(animated: Bool) {
    NSNotificationCenter.defaultCenter().addObserver(self, selector: "handleMovieDurationNoti:", name: MPMovieDurationAvailableNotification, object: nil)
  }
  
  func handleMovieDurationNoti(noti : NSNotification) {
    let player = noti.object as! MPMoviePlayerController
  }
}

