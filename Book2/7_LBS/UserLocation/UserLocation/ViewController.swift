//
//  ViewController.swift
//  UserLocation
//
//  Created by wannabewize on 2014. 12. 12..
//  Copyright (c) 2014년 VanillaStep. All rights reserved.
//

import UIKit
import CoreLocation

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

class ViewController: UIViewController, CLLocationManagerDelegate {
   // 로컬 변수로 선언하면 메모리 해제됨 - 프로퍼티로 선언
   var manager : CLLocationManager!
   
   @IBOutlet weak var textView: UITextView!
   
   var mornitoringLocation : Bool = false
   @IBAction func showUserLocation(sender: AnyObject) {
      textView.text = ""
      previousLocation = nil
      
      print("표준 위치 측정 서비스 가능 \(CLLocationManager.locationServicesEnabled())")
      
      switch CLLocationManager.authorizationStatus() {
      case .AuthorizedAlways, .AuthorizedWhenInUse:
         if mornitoringLocation {
            print("표준 위치 서비스 중지")
            textView.text = "표준 위치 서비스 중지\n"
            manager.stopUpdatingLocation()
            mornitoringLocation = false
         }
         else {
            print("표준 위치 서비스 시작")
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
         print("distance filter : \(manager.distanceFilter)")
         print("accuracy : \(manager.desiredAccuracy)")
      case .NotDetermined:
         //         manager.requestWhenInUseAuthorization()
         manager.requestAlwaysAuthorization()
      default:
         print("위치 정보 접근 권한이 없음 : \(CLLocationManager.authorizationStatus())")
      }
   }
   
   @IBAction func mornitoringHeading(sender: AnyObject) {
      manager.startUpdatingHeading()
   }
   
   func locationManager(manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
      print("trueHeading \(newHeading.trueHeading)")
      print("magHeading \(newHeading.magneticHeading)")
      print("values \(newHeading.x), \(newHeading.y), \(newHeading.z)")
   }
   
   @IBAction func mornitorState(sender: AnyObject) {
      //    manager.sta
   }
   
   func locationManager(manager: CLLocationManager, didDetermineState state: CLRegionState, forRegion region: CLRegion) {
      print("didDetermineState")
   }
   
   var mornitoringSignificantChange = false
   @IBAction func significantChangeMonitoring(sender: AnyObject) {
      textView.text = ""
      previousLocation = nil
      
      print("주요 거리 변화 감지 서비스 가능 \(CLLocationManager.significantLocationChangeMonitoringAvailable())")
      
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
         print("위치 정보 접근 권한이 없음 : \(CLLocationManager.authorizationStatus())")
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
   
   func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
      let location = locations.last!
      
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
      print(str)
   }
   
   @IBAction func mornitoringRegion(sender: AnyObject) {
      //37.533308,127.200351 하남
      let center = CLLocationCoordinate2DMake(37.533308,127.200351)
      let region = CLCircularRegion(center: center, radius: 100.0, identifier: "해운대")
      manager.startMonitoringForRegion(region)
      
      let str = "\(region.identifier) 진출입 감시 시작\n"
      textView.text = str + textView.text
      print(str)
   }
   func locationManager(manager: CLLocationManager, didEnterRegion region: CLRegion) {
      let str = "\(region.identifier) 입장\n"
      textView.text = str + textView.text
      print(str)
   }
   
   func locationManager(manager: CLLocationManager, didExitRegion region: CLRegion) {
      let str = "\(region.identifier) 퇴장\n"
      textView.text = str + textView.text
      print(str)
   }
}
