//
//  ViewController.swift
//  ImagePicker
//
//  Created by wannabewize on 2015. 3. 27..
//  Copyright (c) 2015년 wannabewize. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

  @IBOutlet weak var imageView: UIImageView!
  
  // 앨범에서 이미지 선택
  @IBAction func pickImage(sender: AnyObject) {
    let imagePicker = UIImagePickerController()
    imagePicker.delegate = self
    
    self.presentViewController(imagePicker, animated: true, completion: nil)
  }
  
  // 카메라로 촬영 - 시뮬레이터에서는 동작 안함
  @IBAction func takePicture(sender: AnyObject) {
    if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera) {
      let imagePicker = UIImagePickerController()
      imagePicker.delegate = self
      imagePicker.allowsEditing = true
      
      // 촬영 모드
      imagePicker.sourceType = UIImagePickerControllerSourceType.Camera
      
      self.presentViewController(imagePicker, animated: true, completion: nil)
    }
    else {
      // 카메라 사용 불가 안내
    }
  }
  
  func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
    
    // 원본 이미지와 편집 이미지 모두
    let originalImage = info[UIImagePickerControllerOriginalImage] as! UIImage
    let editedImage = info[UIImagePickerControllerEditedImage] as? UIImage
        
    // 최종 사용할 이미지
    var useImage : UIImage!
    
    if nil == editedImage {
      useImage = originalImage
    }
    else {
      useImage = editedImage!
    }
    
    // 카메라 촬영 모드면 저장
    if picker.sourceType == UIImagePickerControllerSourceType.Camera {
      UIImageWriteToSavedPhotosAlbum(useImage, nil, nil, nil)
    }
    
    imageView.image = useImage

    
    picker.dismissViewControllerAnimated(true, completion: nil)
  }
}

