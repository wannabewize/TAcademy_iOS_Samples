//
//  ViewController.swift
//  Rotation
//
//  Created by Jaehoon Lee on 2016. 9. 17..
//  Copyright © 2016년 Jaehoon Lee. All rights reserved.
//

import UIKit

extension UIUserInterfaceSizeClass {
   var description : String {
      switch self {
      case .Compact:
         return "Compact"
      case .Regular:
         return "Regular"
      case .Unspecified:
         return "Unspecified"
      }
   }   
}

class ViewController: UIViewController {
   
   @IBOutlet weak var verticalLabel: UILabel!
   @IBOutlet weak var horizontalLabel: UILabel!
   override func viewDidLoad() {
      super.viewDidLoad()
      print("viewDidLoad")
   }
   
   override func viewWillLayoutSubviews() {
      print("viewWillLayoutSubviews")
   }
   
   override func viewDidLayoutSubviews() {
      print("viewDidLayoutSubviews")
   }
   
   override func viewWillAppear(animated: Bool) {
      print("viewWillAppear")
   }
   
   override func viewDidAppear(animated: Bool) {
      print("viewDidAppear")
   }
   

   // iPAD와 같이 가로/세로가 동일한 사이즈 클래스인 경우에는 동작하지 않는다.
   override func willTransitionToTraitCollection(newCollection: UITraitCollection, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
      print("willTransitionToTraitCollection")
   }

   // iPAD와 같이 가로/세로가 동일한 사이즈 클래스인 경우에는 동작하지 않는다.
   override func traitCollectionDidChange(previousTraitCollection: UITraitCollection?) {
      print("traitCollectionDidChange")
      horizontalLabel.text = "가로 : \(self.traitCollection.horizontalSizeClass.description)"
      verticalLabel.text = "세로 : \(self.traitCollection.verticalSizeClass.description)"
   }
   
   override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
      print("viewWillTransitionToSize : ", size)
      print("orientation : ",UIDevice.currentDevice().orientation.rawValue)
   }
   
   override func shouldAutorotate() -> Bool {
      return true
   }
   
   
   override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
      // 세로와 (홈 버튼) 오른쪽
      let orientationMask = UIInterfaceOrientationMask.Portrait.rawValue | UIInterfaceOrientationMask.LandscapeRight.rawValue
      return UIInterfaceOrientationMask(rawValue: orientationMask )
      //        return .All
      //        return .Landscape
   }
}

