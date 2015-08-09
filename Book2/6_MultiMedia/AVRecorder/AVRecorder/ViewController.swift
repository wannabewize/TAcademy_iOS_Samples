//
//  ViewController.swift
//  AVRecorder
//
//  Created by wannabewize on 2015. 4. 2..
//  Copyright (c) 2015년 wannabewize. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioRecorderDelegate, UITableViewDataSource, UITableViewDelegate {
  
  var recorder : AVAudioRecorder!
  var player : AVAudioPlayer!
  var recordFiles : [String] = []
  
  @IBOutlet weak var tableView: UITableView!
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return recordFiles.count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("RecordingCell", forIndexPath: indexPath) as! UITableViewCell
    cell.textLabel?.text = recordFiles[indexPath.row]
    return cell
  }
  
  func refreshRecordingList() {
    recordFiles.removeAll(keepCapacity: false)
    
    let docPath = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)[0] as! String
    
    let fs = NSFileManager.defaultManager()
    var error : NSError?
    let files = fs.contentsOfDirectoryAtPath(docPath, error: &error) as! [String]
    
    for file in files {
      // 확장자
      if file.hasSuffix(".caf") {
        recordFiles.append(file)
      }
    }
    tableView.reloadData()
  }
  
  @IBAction func startRecord() {
    let docPath = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)[0] as! String
    
    // 파일 이름이 겹치지 않도록 시간 정보로 파일 이름 생성
    let formatter = NSDateFormatter()
    formatter.dateFormat = "YYYY.MM.dd.hh.mm.DD"
    let fileName = String(format: "%@.caf", formatter.stringFromDate(NSDate()))
    let filePath = docPath.stringByAppendingPathComponent(fileName)
    println("filePath : \(filePath)")
    
    let url = NSURL(fileURLWithPath: filePath)
    let setting = [AVSampleRateKey:44100, AVLinearPCMBitDepthKey:16]
    
    var error : NSError?
    recorder = AVAudioRecorder(URL: url, settings: setting, error: &error)
    recorder.delegate = self
    if recorder.prepareToRecord() {
      recorder.record()
    }
  }
  
  @IBAction func stopRecord() {
    if ( recorder != nil && recorder.recording ) {
      recorder.stop()
      refreshRecordingList()
    }
  }
  
  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    // 녹음 파일 경로 구하기
    let docPath = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)[0] as! String
    let fileName = recordFiles[indexPath.row]
    let filePath = docPath.stringByAppendingPathComponent(fileName)
    
    // 재생기
    let url = NSURL.fileURLWithPath(filePath)
    var error : NSError?
    player = AVAudioPlayer(contentsOfURL: url, error: &error)
    player.play()
  }
  
  @IBAction func stopPlay(sender: AnyObject) {
    if (player != nil && player.playing ) {
      player.stop()
    }
  }
  
  func audioRecorderDidFinishRecording(recorder: AVAudioRecorder!, successfully flag: Bool) {
    println("audioRecorderDidFinishRecording success flag : \(flag)")
  }
  
  override func viewDidAppear(animated: Bool) {
    refreshRecordingList()
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

