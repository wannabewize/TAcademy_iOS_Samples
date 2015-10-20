//
//  ViewController.swift
//  Modal
//
//  Created by wannabewize on 2015. 3. 23..
//  Copyright (c) 2015년 VanillaStep. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ModalActionDelegate {
  
  // 모달 동작의 델리게이트 메소드 구현
  func completeWithModalAction(data: String!) {
    print("모달 동작 완료 : \(data)")
    self.textField.text = data
  }

  // 텍스트 필드
  @IBOutlet weak var textField: UITextField!

  // 엔터키로 키보드 감추기
  @IBAction func textfieldDidEndOnExit(sender: AnyObject) {
  }
  
  // 세그웨이로 씬 전환 준비 - 다음 씬에 데이터 전달
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "MODAL_SEGUE" {
      let vc = segue.destinationViewController as! ModalViewController
      vc.delegate = self
      vc.data = textField.text
    }
    else {
      print("Other Segue")
    }
  }

  
  @IBAction func showModal1(sender: AnyObject) {
    // 세그웨이 ID로 실행
    self.performSegueWithIdentifier("MODAL_SEGUE", sender:sender)
  }
  
  @IBAction func showModal2(sender: AnyObject) {
    // 코드로 VC 얻어서 모달 전환
    let vc = self.storyboard?.instantiateViewControllerWithIdentifier("MODAL_VC") as! ModalViewController
    // 델리게이트 객체 설정
    vc.delegate = self
    // 데이터 전달
    vc.data = textField.text
    // 모달 방식으로 씬 전환
    self.presentViewController(vc, animated: true, completion: nil)
  }
}

