//
//  ViewController.swift
//  AlertViewAndActionSheet
//
//  Created by wannabewize on 2015. 3. 20..
//  Copyright (c) 2015년 wannabewize. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIAlertViewDelegate, UIActionSheetDelegate {

  @IBAction func showAlert(sender: AnyObject) {
    let alert = UIAlertView(title: "알림", message: "다음 중 선택하세요?", delegate: self, cancelButtonTitle:"취소", otherButtonTitles:"확인1", "확인2")
    alert.addButtonWithTitle("확인3")
    alert.tag = 1
    alert.show()
  }
  
  /*
  UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"문자 입력" message:@"문자열을 입력하세요" delegate:self cancelButtonTitle:@"취소" otherButtonTitles:@"확인", nil];
  alert.alertViewStyle = UIAlertViewStylePlainTextInput;
  */
  @IBAction func showTextInputAlert(sender: AnyObject) {
    let alert = UIAlertView(title: "로그인 정보 입력", message: "아이디와 비밀번호를 입력하세요", delegate: self, cancelButtonTitle: "취소", otherButtonTitles: "확인")
    alert.alertViewStyle = UIAlertViewStyle.LoginAndPasswordInput
    alert.tag = 2
    alert.show()
  }
  
  // Swift 버전에서 버튼 인덱스가 동작하지 않는다.
  // 사용자가 얼럿뷰에서 선택을 하면, 델리게이트인 ViewController의 메소드가 동작
  func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
    println("alertView \(buttonIndex) - tag : \(alertView.tag)- firstOtherButtonIndex index : \(alertView.firstOtherButtonIndex)")
    
    if ( 1 == alertView.tag ) {
      if buttonIndex == alertView.cancelButtonIndex {
        println("취소 선택")
      }
      else if buttonIndex == alertView.firstOtherButtonIndex {
        println("첫 번째 선택")
      }
      else if buttonIndex == alertView.firstOtherButtonIndex + 1 {
        println("두 번재 선택")
      }
      else {
        println("나머지")
      }
    }
    else {
      if buttonIndex == alertView.firstOtherButtonIndex {
//       LoginAndPasswordInput는 2개의 텍스트 필드
        let idTextField = alertView.textFieldAtIndex(0)
        let pwTextField = alertView.textFieldAtIndex(1)
        println("id : \(idTextField?.text) , pw : \(pwTextField?.text)")
      }
    }
  }
  
  @IBAction func showActionSheet(sender: AnyObject) {
    let actionSheet = UIActionSheet(title: "액션시트", delegate: self, cancelButtonTitle: "취소", destructiveButtonTitle: "중요", otherButtonTitles: "확인1", "확인2")
    actionSheet.showInView(self.view)
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

