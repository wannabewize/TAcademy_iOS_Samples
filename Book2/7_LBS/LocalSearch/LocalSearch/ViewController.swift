//
//  ViewController.swift
//  LocalSearch
//
//  Created by wannabewize on 2014. 8. 25..
//  Copyright (c) 2014년 VanillaStep. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, UISearchBarDelegate {
  
  @IBOutlet weak var mapView: MKMapView!
  
  func searchBarSearchButtonClicked(searchBar: UISearchBar) {
    let keyword = searchBar.text!
    search(keyword)
    
    searchBar.resignFirstResponder()
  }
  
  func search(keyword : String) {
    let request = MKLocalSearchRequest()
    request.naturalLanguageQuery = keyword
    
    let search = MKLocalSearch(request: request)
    search.startWithCompletionHandler { (response : MKLocalSearchResponse?, error : NSError?) -> Void in
      let items = response!.mapItems
      for item in items {
        print("name : \(item.placemark.name)")
        
        let annotation = MKPointAnnotation()
        annotation.title = item.name
        annotation.coordinate = item.placemark.location!.coordinate
        
        self.mapView.addAnnotation(annotation)
      }
    }
  }
  
  override func viewWillAppear(animated: Bool) {
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

