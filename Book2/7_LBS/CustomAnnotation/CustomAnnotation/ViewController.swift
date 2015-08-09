//
//  ViewController.swift
//  CustomAnnotation
//
//  Created by wannabewize on 2015. 3. 27..
//  Copyright (c) 2015년 wannabewize. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {
  @IBOutlet weak var mapView : MKMapView!
  
  override func viewDidAppear(animated: Bool) {
    self.moveToSeoul()
    self.addAnnotation()
  }
  
  func moveToSeoul() {
    let center = CLLocationCoordinate2DMake(37.551403, 126.988045)
    let span = MKCoordinateSpanMake(0.2, 0.2)
    let region = MKCoordinateRegionMake(center, span)
    mapView.setRegion(region, animated: true)
  }
  
  func addAnnotation() {
    let annotation = MKPointAnnotation()
    annotation.title = "남산"
    annotation.coordinate = CLLocationCoordinate2DMake(37.551403, 126.988045)
    self.mapView.addAnnotation(annotation)
    
    let museum = MKPointAnnotation()
    museum.title = "국립중앙박물관"
    museum.coordinate = CLLocationCoordinate2DMake(37.523984, 126.980355)
    self.mapView.addAnnotation(museum)
  }
  
  func mapView(mapView: MKMapView!, viewForAnnotation annotation: MKAnnotation!) -> MKAnnotationView! {
    if annotation.title == "국립중앙박물관" {
      var annotationView = mapView.dequeueReusableAnnotationViewWithIdentifier("MUSEUM")
      if nil == annotationView {
        annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "MUSEUM")
      }
      
      annotationView.image = UIImage(named: "museum.png")
      annotationView.canShowCallout = true
      
      return annotationView
    }
    else {
      var annotationView : MKPinAnnotationView! = mapView.dequeueReusableAnnotationViewWithIdentifier("DEFAULT") as? MKPinAnnotationView
      if nil == annotationView {
        annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "DEFAULT") as MKPinAnnotationView
        annotationView.pinColor = MKPinAnnotationColor.Purple
        annotationView.canShowCallout = true
      }
      return annotationView
    }
  }
}

