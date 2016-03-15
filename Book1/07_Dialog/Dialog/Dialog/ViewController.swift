//
//  ViewController.swift
//  Dialog
//
//  Created by wannabewize on 2014. 12. 21..
//  Copyright (c) 2014년 VanillaStep. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
   @IBOutlet weak var inputLabel: UILabel!
   
   @IBAction func showAlertView(sender: AnyObject) {
      let dialog = UIAlertController(title: "계속 진행하겠습니까?", message: "이 곳에 메세지 입력", preferredStyle: UIAlertControllerStyle.Alert)
      
      let cancelAction = UIAlertAction(title: "취소", style: UIAlertActionStyle.Cancel) { (action : UIAlertAction!) -> Void in
         print("취소 선택")
      }
      
      let okAction = UIAlertAction(title: "확인", style: UIAlertActionStyle.Default) { (action) -> Void in
         print("확인 선택")
      }
      
      dialog.addAction(cancelAction)
      dialog.addAction(okAction)
      
      self.presentViewController(dialog, animated: true, completion: nil)
      
   }
   
   @IBAction func showAlertViewWithTextInput(sender: AnyObject) {
      let dialog = UIAlertController(title: "비밀 번호 입력", message: nil, preferredStyle: UIAlertControllerStyle.Alert)
      
      
      let okAction = UIAlertAction(title: "확인", style: UIAlertActionStyle.Destructive) { (action) -> Void in
         let userInput = dialog.textFields![0]
         self.inputLabel.text = userInput.text
      }
      dialog.addAction(okAction)
      
      
      let cancelAction = UIAlertAction(title: "취소", style: UIAlertActionStyle.Cancel) { (action) -> Void in
         print("취소 선택")
         self.inputLabel.text = "취소 선택"
      }
      dialog.addAction(cancelAction)
      
      dialog.addTextFieldWithConfigurationHandler { (textField : UITextField) -> Void in
         // 키보드 설정
         textField.keyboardType = UIKeyboardType.NumberPad
         textField.secureTextEntry = true
      }
      
      self.presentViewController(dialog, animated: true, completion: nil)
   }
   
   @IBAction func showAutocloseAlert(sender: AnyObject) {
      let dialog = UIAlertController(title: "자동 종료", message: "이 메세지는 3초뒤 자동으로 사라집니다.", preferredStyle: UIAlertControllerStyle.Alert)
      
      let okAction = UIAlertAction(title: "확인", style: UIAlertActionStyle.Default, handler: nil)
      dialog.addAction(okAction)

      self.presentViewController(dialog, animated: true) { () -> Void in
         NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: "closeDialog", userInfo: nil, repeats: false)
      }
   }
   
   func closeDialog() {
      if let dialog = self.presentedViewController as? UIAlertController {
         print("close!")
         dialog.dismissViewControllerAnimated(true, completion: nil)
      }
   }
   
   @IBAction func showActionSheet(sender: AnyObject) {
      let dialog = UIAlertController(title: "액션시트", message: "메세지", preferredStyle: UIAlertControllerStyle.ActionSheet)
      
      let deleteAction = UIAlertAction(title: "삭제", style: UIAlertActionStyle.Destructive) { (action) -> Void in
         print("삭제 선택")
      }
      dialog.addAction(deleteAction)
      
      
      let otherAction = UIAlertAction(title: "다른 선택", style: UIAlertActionStyle.Default) { (actino) -> Void in
         print("다른 선택!")
      }
      dialog.addAction(otherAction)
      
      let cancelAction = UIAlertAction(title: "취소", style: UIAlertActionStyle.Cancel) { (action) -> Void in
         print("취소 선택")
      }
      dialog.addAction(cancelAction)
      
      self.presentViewController(dialog, animated: true, completion: nil)
   }
}

