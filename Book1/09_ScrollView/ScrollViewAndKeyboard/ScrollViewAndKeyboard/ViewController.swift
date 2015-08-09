//
//  ViewController.swift
//  ScrollViewAndKeyboard
//
//  Created by wannabewize on 2015. 3. 19..
//  Copyright (c) 2015년 wannabewize. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var scrollView: UIScrollView!
  override func viewDidAppear(animated: Bool) {
    NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
    NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
  }
  
  // UIKeyboardWillShowNotification 알림 발생시
  func keyboardWillShow(noti : NSNotification) {
    if let rectObj = noti.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue {
      // 키보드 크기
      let keyboardRect = rectObj.CGRectValue()
      println("keyboard : \(keyboardRect)")
      
      // 스크롤 뷰의 콘텐츠 표시 영역을 키보드의 높이만큼 제하기
      let inset = UIEdgeInsetsMake(0, 0, keyboardRect.height, 0)
      scrollView.contentInset = inset
      scrollView.scrollIndicatorInsets = inset
      
      // 편집중인 텍스트 필드 찾기 - 스크롤 뷰의 자식 뷰에서 찾아야 한다.
      if let textField = findFirstResponder() as? UITextField {
        
        // 스크롤한 범위를 고려한 텍스트 필드의 위치, x는 무시, y만 사용
        let textFieldPoint = CGPointMake(0, textField.frame.origin.y - scrollView.contentOffset.y)
        
        // 키보드에 텍스트필드가 가리는지 체크
        if CGRectContainsPoint(keyboardRect, textFieldPoint) {
          println("키보드에 가림")
          // 텍스트 필드를 키보드 밖으로 보이도록 스크롤 할 거리
          let dy = textFieldPoint.y - keyboardRect.origin.y + textField.frame.size.height

          // 스크롤 뷰의 컨텐츠 오프셋을 이용해서 스크롤
          let newContentOffset = CGPointMake(scrollView.contentOffset.x, scrollView.contentOffset.y + dy)
          scrollView.setContentOffset(newContentOffset, animated: true)
        }
        else {
          println("키보드에 가리지 않음")
        }
      }
    }
  }
  
  // UIKeyboardWillHideNotification 알림 발생시
  func keyboardWillHide(noti : NSNotification) {
    // 스크롤 뷰의 컨텐츠 표시 영역을 원래대로
    scrollView.contentInset = UIEdgeInsetsZero
    scrollView.scrollIndicatorInsets = UIEdgeInsetsZero
  }
  
  // 스크롤 뷰의 자식 뷰에서 최초 응답 객체 찾기
  func findFirstResponder() -> UIResponder? {
    for v in scrollView.subviews {
      if v.isFirstResponder() {
        return (v as! UIResponder)
      }
    }
    // 없으면 nil 반환
    return nil
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

