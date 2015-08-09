//
//  DrawingView.swift
//  TouchDrawing
//
//  Created by wannabewize on 2015. 5. 5..
//  Copyright (c) 2015년 wannabewize. All rights reserved.
//

import UIKit

class DrawingView: UIView {

  var path = UIBezierPath()
  
  override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
    let touch = touches.first as! UITouch
    // 터치뷰 전체에서의 좌표
    let point = touch.locationInView(self)
    path.moveToPoint(point)
  }
  
  override func touchesMoved(touches: Set<NSObject>, withEvent event: UIEvent) {
    let touch = touches.first as! UITouch
    let point = touch.locationInView(self)
    // 이동한 좌표까지 직선 그리기 경로 추가
    path.addLineToPoint(point)
    // 다시 그리기
    self.setNeedsDisplay()
  }
  
  override func drawRect(rect: CGRect) {
    path.stroke()
  }
}
