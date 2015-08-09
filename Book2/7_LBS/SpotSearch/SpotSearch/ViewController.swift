//
//  ViewController.swift
//  SpotSearch
//
//  Created by wannabewize on 2015. 5. 13..
//  Copyright (c) 2015년 wannabewize. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, UISearchBarDelegate {
  // 맵뷰 아웃렛
  @IBOutlet weak var mapView: MKMapView!
  
  func searchBarSearchButtonClicked(searchBar: UISearchBar) {
    // 키보드 감추기
    searchBar.resignFirstResponder()
    
    // 기존 검색 결과 삭제
    self.mapView.removeAnnotations(self.mapView.annotations)
    
    // 검색 메소드 호출
    let searchKeyword = searchBar.text
    self.searchSpots(searchKeyword)
  }
  
  func searchSpots(keyword : String) {
    // 검색 요청 객체 생성
    let request = MKLocalSearchRequest()
    
    // 검색 키워드와 검색 범위 설정
    request.naturalLanguageQuery = keyword
    request.region = self.mapView.region
    
    // 검색 서비스 객체 생성
    let search = MKLocalSearch(request: request)
    // 검색 요청
    search.startWithCompletionHandler { (response : MKLocalSearchResponse!, error : NSError!) -> Void in
      if error != nil {
        println("에러 : \(error.localizedDescription)")
        return
      }
      
      // 모든 검색 결과가 지도에 출력되도록 표시 영역 설정
      let region = response.boundingRegion
      self.mapView.setRegion(region, animated: true)
      
      // 검색 결과 배열
      let spots = response.mapItems as! [MKMapItem]
      for spot in spots {
        let annotation = MKPointAnnotation()
        // 위치 정보와 이름 설정
        annotation.coordinate = spot.placemark.coordinate
        annotation.title = spot.name
        annotation.subtitle = spot.phoneNumber
        
        println("이름 : \(spot.name)")
        println("전화번호 : \(spot.phoneNumber)")
        println("위치 : \(spot.placemark.coordinate)")
        println("우편번호 : \(spot.placemark.postalCode)")
        
        // 지도에 위치 정보 추가
        self.mapView.addAnnotation(annotation)
      }
    }
  }
}

