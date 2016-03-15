//
//  ViewController.swift
//  TextFieldAndKeyboard
//
//  Created by wannabewize on 2015. 3. 18..
//  Copyright (c) 2015년 VanillaStep. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  override func viewDidAppear(animated: Bool) {
    // 키보드 알림 감시 객체 등록
    NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillShow:"), name: UIKeyboardDidShowNotification, object: nil)
    NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillHide:"), name: UIKeyboardWillHideNotification
      , object: nil)
  }
  
  override func viewDidDisappear(animated: Bool) {
    // 감시 객체 삭제
    NSNotificationCenter.defaultCenter().removeObserver(self)
  }
  
  // 키보드 알림 처리
  func keyboardWillShow(noti : NSNotification) {
    print("키보드가 나타났다.")
    
    if let rectObj = noti.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue {
      let keyboardRect = rectObj.CGRectValue()
      
      print("userinfo : \(noti.userInfo)")
      print("keyboard Rect : \(keyboardRect)")
      
      // 최초 응답 객체 찾기
      let textField = findFirstResponder() as! UITextField
      print("TextField rect : \(textField.frame)")
      // 키보드에 가리는지 체크
      if CGRectContainsPoint(keyboardRect, textField.frame.origin) {
        print("키보드에 가림")
        let dy = keyboardRect.origin.y - textField.frame.origin.y - textField.frame.size.height - 10
        self.view.transform = CGAffineTransformMakeTranslation(0, dy)
      }
      else {
        print("키보드에 가리지 않음")
      }
    }
  }
  
  // 키보드가 사라지는 알림 처리
  func keyboardWillHide(noti : NSNotification) {
    self.view.transform = CGAffineTransformIdentity
  }
  
  func findFirstResponder() -> UIResponder? {
    for v in self.view.subviews {
      if v.isFirstResponder() {
        return (v as UIResponder)
      }
    }
    return nil
  }
  
  func handleTap(gesture : UITapGestureRecognizer) {
    // 최초 응답 객체 찾기
    if let firstRespond = self.findFirstResponder() {
      firstRespond.resignFirstResponder()
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // 탭 동작 인식기
    let gestureRecognizer = UITapGestureRecognizer(target: self, action: Selector("handleTap:"))
    // 씬의 배경 뷰에 탭 동작 인식기 등록
    self.view.addGestureRecognizer(gestureRecognizer)
  }
}


