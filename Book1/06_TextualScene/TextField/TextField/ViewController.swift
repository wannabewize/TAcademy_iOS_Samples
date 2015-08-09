//
//  ViewController.swift
//  TextField
//
//  Created by wannabewize on 2015. 3. 18..
//  Copyright (c) 2015년 wannabewize. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var label: UILabel!
  @IBOutlet weak var textField: UITextField!
  
  // 엔터키로 사라짐
  @IBAction func textFieldDidEndOnExit(sender: AnyObject) {
  }
  
  // Editing Changed 이벤트
  @IBAction func textFieldEditingChanged(sender: AnyObject) {
    self.label.text = self.textField.text
  }

  // Editing Did Begin 이벤트와 연결
  @IBAction func textFieldEditingDidBegin(sender: AnyObject) {
    self.label.textColor = UIColor.blueColor()
  }
  
  // Editing Did End 이벤트와 연결
  @IBAction func textFieldEditingEnd(sender: AnyObject) {
    self.label.textColor = UIColor.redColor()
  }

  override func viewDidLoad() {
    super.viewDidLoad()
//    
//    let textField = UITextField(frame: CGRectMake(20, 50, 200, 50))
//    // 안내 문구
//    textField.placeholder = "여기에 메일 주소를 입력하세요"
//    // 폰트
//    textField.font = UIFont.systemFontOfSize(20)
//    // 둥근 사각형 테두리
//    textField.borderStyle = UITextBorderStyle.RoundedRect
//    // 편집 상태일 때 내용 삭제 버튼
//    textField.clearsOnBeginEditing = true
//    // URL 입력용 키보드
//    textField.keyboardType = UIKeyboardType.URL
//    // 부 구조에 추가
//    self.view.addSubview(textField)
  }
}

