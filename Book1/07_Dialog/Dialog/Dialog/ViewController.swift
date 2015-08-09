//
//  ViewController.swift
//  Dialog
//
//  Created by wannabewize on 2014. 12. 21..
//  Copyright (c) 2014년 VanillaStep. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBAction func showAlertView(sender: AnyObject) {
    let dialog = UIAlertController(title: "계속 진행하겠습니까?", message: "이 곳에 메세지 입력", preferredStyle: UIAlertControllerStyle.Alert)
    
    let cancelAction = UIAlertAction(title: "취소", style: UIAlertActionStyle.Cancel) { (action : UIAlertAction!) -> Void in
      println("취소 선택")
    }
    
    let okAction = UIAlertAction(title: "확인", style: UIAlertActionStyle.Default) { (action) -> Void in
      println("확인 선택")
    }
    
    dialog.addAction(cancelAction)
    dialog.addAction(okAction)
    
    self.presentViewController(dialog, animated: true, completion: nil)

  }
  @IBAction func showAlertViewWithTextInput(sender: AnyObject) {
    let dialog = UIAlertController(title: "내용을 입력하세요", message: "내용 입력", preferredStyle: UIAlertControllerStyle.Alert)

    
    let okAction = UIAlertAction(title: "확인", style: UIAlertActionStyle.Destructive) { (action) -> Void in
      let userInput = dialog.textFields![0] as! UITextField
      println("사용자 입력 \(userInput.text)")
    }
    dialog.addAction(okAction)

    
    let cancelAction = UIAlertAction(title: "취소", style: UIAlertActionStyle.Cancel) { (action) -> Void in
      println("취소 선택")
    }
    dialog.addAction(cancelAction)
    
    
    dialog.addTextFieldWithConfigurationHandler { (textField : UITextField!) -> Void in
      
    }
    
    self.presentViewController(dialog, animated: true, completion: nil)
  }
  @IBAction func showActionSheet(sender: AnyObject) {
    let dialog = UIAlertController(title: "액션시트", message: "메세지", preferredStyle: UIAlertControllerStyle.ActionSheet)
    
    let deleteAction = UIAlertAction(title: "삭제", style: UIAlertActionStyle.Destructive) { (action) -> Void in
      println("삭제 선택")
    }
    dialog.addAction(deleteAction)
    
    
    let otherAction = UIAlertAction(title: "다른 선택", style: UIAlertActionStyle.Default) { (actino) -> Void in
      println("다른 선택!")
    }
    dialog.addAction(otherAction)
    
    let cancelAction = UIAlertAction(title: "취소", style: UIAlertActionStyle.Cancel) { (action) -> Void in
      println("취소 선택")
    }
    dialog.addAction(cancelAction)
    
    
    // 에러
//    dialog.addTextFieldWithConfigurationHandler { (textField) -> Void in
//    }
    self.presentViewController(dialog, animated: true, completion: nil)
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

