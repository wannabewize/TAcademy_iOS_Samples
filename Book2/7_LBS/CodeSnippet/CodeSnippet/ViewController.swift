//
//  ViewController.swift
//  CodeSnippet
//
//  Created by wannabewize on 2015. 3. 27..
//  Copyright (c) 2015년 wannabewize. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

import CoreMotion

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
  @IBOutlet weak var mapView: MKMapView!
  
  var manager : CLLocationManager!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    manager = CLLocationManager()
    manager.delegate = self
    manager.desiredAccuracy = kCLLocationAccuracyBest
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
    let location = locations.last as CLLocation
    let coord = location.coordinate
  }
  
  func mapView(mapView: MKMapView!, rendererForOverlay overlay: MKOverlay!) -> MKOverlayRenderer! {
    //    if overlay is MKCircle {
    let renderer = MKCircleRenderer(overlay: overlay)
    renderer.lineWidth = 5.0
    renderer.strokeColor = UIColor.redColor()
    return renderer
    //    }
    //    else
  }
  
  var manager2 : CMMotionManager!
  func aaa() {
    manager2.accelerometerAvailable
    manager2.startAccelerometerUpdatesToQueue(NSOperationQueue.mainQueue(), withHandler: { (data : CMAccelerometerData!, error : NSError!) -> Void in
      
      let x = data.acceleration.x
      let y = data.acceleration.y
      let z = data.acceleration.z
      
    })
    manager2.startGyroUpdatesToQueue(NSOperationQueue.mainQueue(), withHandler: { (data : CMGyroData!, error : NSError!) -> Void in
      let x = data.rotationRate.x
      let y = data.rotationRate.y
      let z = data.rotationRate.z
    })
    
    manager2.startMagnetometerUpdatesToQueue(NSOperationQueue.mainQueue(), withHandler: { (data : CMMagnetometerData!, error : NSError!) -> Void in
      let x = data.magneticField.x
      let y = data.magneticField.y
      let z = data.magneticField.z
    })
    
  }
  
  @IBAction func showAddress(gesture : UITapGestureRecognizer) {
    let point = gesture.locationInView(mapView)
    let coord = mapView.convertPoint(point, toCoordinateFromView: mapView)
    let location = CLLocation(latitude: coord.latitude, longitude: coord.longitude)
    
    let geocoder = CLGeocoder()
    geocoder.reverseGeocodeLocation(location, completionHandler: { (placeMarks : [AnyObject]!, error : NSError!) -> Void in
      let placeMark = placeMarks[0] as CLPlacemark
      println("Reversed : \(placeMark)")
    })
    
    let address = "서울 서초구 남부순환로 2406"
    geocoder.geocodeAddressString(address, completionHandler: { (placeMarks : [AnyObject]!, error : NSError!) -> Void in
      let placeMark = placeMarks[0] as CLPlacemark
      let location = placeMark.location
      let coord = location.coordinate
      println("위경도 : \(coord)")
    })
    
  }
  
  @IBAction func startRegionMonitoring(sender : AnyObject) {
    let center = CLLocationCoordinate2DMake(35.159044,129.162435)
    mapView.setCenterCoordinate(center, animated: true)
    let region = CLCircularRegion(center: center, radius: 100.0, identifier: "해운대")
    
    manager.startMonitoringForRegion(region)
  }
  
  func locationManager(manager: CLLocationManager!, didEnterRegion region: CLRegion!) {
    println("\(region.identifier) 입장")
  }
  
  func locationManager(manager: CLLocationManager!, didExitRegion region: CLRegion!) {
    println("\(region.identifier) 퇴장")
  }
  
}

