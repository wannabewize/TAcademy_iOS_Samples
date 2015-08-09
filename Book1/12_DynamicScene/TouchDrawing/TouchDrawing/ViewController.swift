//
//  ViewController.swift
//  TouchDrawing
//
//  Created by wannabewize on 2015. 5. 5..
//  Copyright (c) 2015년 wannabewize. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    
    // 코드로 작성하는 경우
    let drawingView = DrawingView()
    drawingView.backgroundColor = UIColor.whiteColor()
    drawingView.frame = self.view.frame
    self.view.addSubview(drawingView)
  }
}

