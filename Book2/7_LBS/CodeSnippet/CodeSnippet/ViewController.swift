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
  
  func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    let location = locations.last!
    let coord = location.coordinate
  }
  
  func mapView(mapView: MKMapView, rendererForOverlay overlay: MKOverlay) -> MKOverlayRenderer {
    //    if overlay is MKCircle {
    let renderer = MKCircleRenderer(overlay: overlay)
    renderer.lineWidth = 5.0
    renderer.strokeColor = UIColor.redColor()
    return renderer
    //    }
    //    else
  }
  
  
  @IBAction func showAddress(gesture : UITapGestureRecognizer) {
    let point = gesture.locationInView(mapView)
    let coord = mapView.convertPoint(point, toCoordinateFromView: mapView)
    let location = CLLocation(latitude: coord.latitude, longitude: coord.longitude)
    
    let geocoder = CLGeocoder()
    geocoder.reverseGeocodeLocation(location) { (placeMarks : [CLPlacemark]?, error : NSError?) -> Void in
      let placeMark = placeMarks![0]
      print("Reversed : \(placeMark)")
    }
    
    let address = "서울 서초구 남부순환로 2406"
    geocoder.geocodeAddressString(address) { (placeMarks : [CLPlacemark]?, error : NSError?) -> Void in
      let placeMark = placeMarks![0]
      let location = placeMark.location!
      let coord = location.coordinate
      print("위경도 : \(coord)")
    }
    
  }
  
  @IBAction func startRegionMonitoring(sender : AnyObject) {
    let center = CLLocationCoordinate2DMake(35.159044,129.162435)
    mapView.setCenterCoordinate(center, animated: true)
    let region = CLCircularRegion(center: center, radius: 100.0, identifier: "해운대")
    
    manager.startMonitoringForRegion(region)
  }
  
  func locationManager(manager: CLLocationManager, didEnterRegion region: CLRegion) {
    print("\(region.identifier) 입장")
  }
  
  func locationManager(manager: CLLocationManager, didExitRegion region: CLRegion) {
    print("\(region.identifier) 퇴장")
  }
  
}

