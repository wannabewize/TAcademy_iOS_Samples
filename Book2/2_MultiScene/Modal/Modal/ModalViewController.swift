//
//  ModalViewController.swift
//  Modal
//
//  Created by wannabewize on 2015. 3. 23..
//  Copyright (c) 2015년 VanillaStep. All rights reserved.
//

import UIKit

// 모달 동작 처리를 위한 델리게이트 프로토콜 - class 전용
protocol ModalActionDelegate : class {
  func completeWithModalAction(data : String!)
}

class ModalViewController: UIViewController {
  
  @IBOutlet weak var textField: UITextField!
  // 델리게이트 - 프로토콜 타입을 weak로 선언하려고 - 클래스 전용 프로토콜로
  weak var delegate : ModalActionDelegate!
  
  // 다른 씬에게서 전달받은 데이터
  var data : String!
  // 데이터를 뷰에 반영
  override func viewWillAppear(animated: Bool) {
    textField.text = data
  }

  // 완료 버튼 누르면 동작
  @IBAction func dismissModal(sender: AnyObject) {
    let data = textField.text
    delegate.completeWithModalAction(data)
    self.dismissViewControllerAnimated(true, completion: nil)
    
    println("presentedVC : \(self.presentedViewController)")
    println("presentingVC : \(self.presentingViewController)")
  }
  
  // 키보드 감추기 - Did End On Exit 이벤트 연결
  @IBAction func textfieldDidEndOnExit(sender: AnyObject) {
  }
}
