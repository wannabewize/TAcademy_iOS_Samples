//
//  ViewController.swift
//  UserLocation
//
//  Created by wannabewize on 2014. 12. 12..
//  Copyright (c) 2014년 VanillaStep. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
  // 로컬 변수로 선언하면 메모리 해제됨 - 프로퍼티로 선언
  var manager : CLLocationManager!
  
  @IBOutlet weak var textView: UITextView!
  
  var mornitoringLocation : Bool = false
  @IBAction func showUserLocation(sender: AnyObject) {
    textView.text = ""
    previousLocation = nil
    
    println("표준 위치 측정 서비스 가능 \(CLLocationManager.locationServicesEnabled())")

    switch CLLocationManager.authorizationStatus() {
    case .AuthorizedAlways, .AuthorizedWhenInUse:
      if mornitoringLocation {
        println("표준 위치 서비스 중지")
        textView.text = "표준 위치 서비스 중지\n"
        manager.stopUpdatingLocation()
        mornitoringLocation = false
      }
      else {
        println("표준 위치 서비스 시작")
        textView.text = "표준 위치 서비스 시작\n"
        // 100미터 단위 정확도
        manager.desiredAccuracy = kCLLocationAccuracyBest
        // 10미터 이동
        manager.distanceFilter = 10
        
        // 10초 이후, 100미터 이동 이후에 동작
        manager.allowDeferredLocationUpdatesUntilTraveled(100, timeout: 10)
        manager.startUpdatingLocation()
        mornitoringLocation = true
      }
      println("distance filter : \(manager.distanceFilter)")
      println("accuracy : \(manager.desiredAccuracy)")
    case .NotDetermined:
      manager.requestWhenInUseAuthorization()
//      manager.requestAlwaysAuthorization()
    default:
      println("위치 정보 접근 권한이 없음 : \(CLLocationManager.authorizationStatus())")
    }
  }
  
  @IBAction func mornitoringHeading(sender: AnyObject) {
    manager.startUpdatingHeading()
  }
  
  func locationManager(manager: CLLocationManager!, didUpdateHeading newHeading: CLHeading!) {
    println("trueHeading \(newHeading.trueHeading)")
    println("magHeading \(newHeading.magneticHeading)")
    println("values \(newHeading.x), \(newHeading.y), \(newHeading.z)")
  }
  
  @IBAction func mornitorState(sender: AnyObject) {
//    manager.sta
  }
  
  func locationManager(manager: CLLocationManager!, didDetermineState state: CLRegionState, forRegion region: CLRegion!) {
    println("didDetermineState")
  }
  
  var mornitoringSignificantChange = false
  @IBAction func significantChangeMonitoring(sender: AnyObject) {
    textView.text = ""
    previousLocation = nil
    
    println("주요 거리 변화 감지 서비스 가능 \(CLLocationManager.significantLocationChangeMonitoringAvailable())")
    
    switch CLLocationManager.authorizationStatus() {
    case .AuthorizedAlways, .AuthorizedWhenInUse:
      if mornitoringSignificantChange {
        manager.stopMonitoringSignificantLocationChanges()
        mornitoringSignificantChange = false
        textView.text = "Significant Change Location Service Stopped"
      }
      else {
        manager.startMonitoringSignificantLocationChanges()
        mornitoringSignificantChange = true
        textView.text = "Significant Change Location Service Started"
      }
    case .NotDetermined:
      manager.requestAlwaysAuthorization()
    default:
      println("위치 정보 접근 권한이 없음 : \(CLLocationManager.authorizationStatus())")
    }
  }
  
  var timeFormatter : NSDateFormatter!
  var previousLocation : CLLocation!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    manager = CLLocationManager()
    manager.delegate = self
    
    timeFormatter = NSDateFormatter()
    timeFormatter.timeStyle = NSDateFormatterStyle.MediumStyle
  }
  
  func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
    let location = locations.last as! CLLocation
    
    var str = "============================\n"
    str += "측정 시각\t: \(timeFormatter.stringFromDate(location.timestamp))\n"
    str += "현재 위치\t: \(location.coordinate.latitude)" + ",\(location.coordinate.longitude)\n"
    str += "고도\t\t: \(location.altitude)\n"

    if let floor = location.floor {
      str += "현재 층\t: \(floor.level)\n"
    }
    
    // 이동 거리 측정
    if previousLocation != nil {
      str += "이동거리\t: \(location.distanceFromLocation(previousLocation))\n"
    }
    previousLocation = location
    
    str += "활동\t\t:\(manager.activityType.description())\n"
    
    // 텍스트 뷰에 반영
    textView.text = str + textView.text
    println(str)
  }
  
  @IBAction func mornitoringVisit(sender: AnyObject) {
    manager.startMonitoringVisits()
  }
  
  func locationManager(manager: CLLocationManager!, didVisit visit: CLVisit!) {
    var str = "============================\n"
    str += "방문 지역!\n"
    str += "departure date\t: \(visit.departureDate)\n"
    str += "arrival date\t:\(visit.arrivalDate)\n"
    
    textView.text = str + textView.text
    println(str)
  }
  
  func locationManagerDidPauseLocationUpdates(manager: CLLocationManager!) {
    println("locationManagerDidPauseLocationUpdates")
  }
  
  func locationManagerDidResumeLocationUpdates(manager: CLLocationManager!) {
    println("locationManagerDidResumeLocationUpdates")
  }
    
  func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!) {
    println("Error : \(error.localizedDescription)")
    textView.text = "위치 측정 에러 \(error.localizedDescription)"
  }
}

extension CLActivityType {
  func description() -> String {
    switch self {
    case .Other:
      return "Other"
    case .AutomotiveNavigation:
      return "Automotive Navigation"
    case .Fitness:
      return "Fitness"
    case .OtherNavigation:
      return "Other Navigation"
    }
  }
}
