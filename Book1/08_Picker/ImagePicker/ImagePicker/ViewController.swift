//
//  ViewController.swift
//  ImagePicker
//
//  Created by wannabewize on 2015. 3. 18..
//  Copyright (c) 2015년 wannabewize. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
   
   @IBOutlet weak var pickerView: UIPickerView!
   // 공백 배열
   var data = [UIImage]()
   
   func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
      return 1
   }
   
   func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
      return data.count
   }
   
   // 이미지 뷰를 피커뷰에 제공
   func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView?) -> UIView {
      let image = data[row]
      let itemView : UIImageView = UIImageView(image: image)
      return itemView
   }
   
   @IBAction func selectRandom(sender: AnyObject) {
      // 난수 발생
      let r = Int(arc4random()) % data.count
      // 피커에서 선택
      pickerView.selectRow(r, inComponent: 0, animated: true)
   }
   
   override func viewDidLoad() {
      super.viewDidLoad()
      // 이미지 배열
      data = [UIImage(named:"img0")!,
         UIImage(named:"img1")!,
         UIImage(named:"img2")!,
         UIImage(named:"img3")!,
         UIImage(named:"img4")!,
         UIImage(named:"img5")!,
         UIImage(named:"img6")!]
   }
}

