//
//  ViewController.swift
//  SpotAction
//
//  Created by wannabewize on 2015. 3. 27..
//  Copyright (c) 2015년 wannabewize. All rights reserved.
//

import UIKit
import MapKit

class MuseumInfo : MKPointAnnotation {
  var phoneNumber : String!
  var exhibition : [String]!
  var urlStr : String!
}

class CafeInfo : MKPointAnnotation {

}

class ViewController: UIViewController, MKMapViewDelegate {
  @IBOutlet weak var mapView : MKMapView!
  
  override func viewWillAppear(animated: Bool) {
    moveToSeoul()
    showCafe()
    showMuseum()
  }

  func moveToSeoul() {
    let center = CLLocationCoordinate2DMake(37.551403, 126.988045)
    let span = MKCoordinateSpanMake(0.2, 0.2)
    let region = MKCoordinateRegionMake(center, span)
    mapView.setRegion(region, animated: true)
  }
  
  func showCafe() {
    // 카페용 어노테이션 객체 생성
    let cafe = CafeInfo()
    cafe.title = "스타벅스"
    cafe.coordinate = CLLocationCoordinate2DMake(37.561755,126.985254)
    mapView.addAnnotation(cafe)
  }
  
  func showMuseum() {
    // 박물관용 어노테이션 객체 생성
    let museum1 = MuseumInfo()
    museum1.title = "국립중앙박물관"
    museum1.coordinate = CLLocationCoordinate2DMake(37.523984, 126.980355)
    museum1.phoneNumber = "02-2077-9000"
    museum1.exhibition = ["다산 정약용", "고려 불화대전", "흙으로 빚는 아시아의 꿈"]
    museum1.urlStr = "http://www.museum.go.kr"
    
    let museum2 = MuseumInfo()
    museum2.title = "세종문화회관"
    museum2.coordinate = CLLocationCoordinate2DMake(37.572618,126.975203)
    museum2.phoneNumber = "02-399-1114"
    museum2.exhibition = ["점핑 위드 러브", "세종 이야기", "충무공 이야기"]
    museum2.urlStr = "http://www.sejongpac.or.kr"
    
    mapView.addAnnotations([museum1, museum2])
    
  }
  
  let MUSEUM_ANNOTATIONVIEW = "MUSEUM_ANNOTATIONVIEW"
  let CAFE_ANNOTATIONVIEW = "CAFE_ANNOTATIONVIEW"
  
  func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
    if annotation is MuseumInfo {
      var annotationView = mapView.dequeueReusableAnnotationViewWithIdentifier(MUSEUM_ANNOTATIONVIEW)
      if nil == annotationView {
        annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: MUSEUM_ANNOTATIONVIEW)
      }
      else {
         annotationView!.annotation = annotation
      }
      annotationView!.image = UIImage(named: "museum")
      annotationView!.canShowCallout = true
      
      let infoButton = UIButton(type: UIButtonType.InfoLight)
      annotationView!.rightCalloutAccessoryView = infoButton
      
      return annotationView
    }
    else {
      var annotationView = mapView.dequeueReusableAnnotationViewWithIdentifier(CAFE_ANNOTATIONVIEW)
      if nil == annotationView {
        annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: CAFE_ANNOTATIONVIEW)
        // 어노테이션 뷰 설정
        annotationView!.image = UIImage(named: "coffee")
        annotationView!.canShowCallout = true
      }
      else {
         annotationView!.annotation = annotation
      }

      return annotationView
    }
  }
  
  // 콜아웃 버튼 동작
  func mapView(mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
    if let museum = view.annotation as? MuseumInfo {
      let urlStr = museum.urlStr
      
      // 다음에 나타날 씬에 데이터 전달
      let detailVC = self.storyboard?.instantiateViewControllerWithIdentifier("DETAIL_VC") as! DetailViewController
      detailVC.urlStr = urlStr
      
      self.presentViewController(detailVC, animated: true, completion: nil)
    }
  }
}

