//
//  ViewController.swift
//  ImagePicker
//
//  Created by wannabewize on 2015. 3. 27..
//  Copyright (c) 2015년 wannabewize. All rights reserved.
//

import UIKit
import MobileCoreServices

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
   
   // 3초뒤 자동 촬영
   @IBAction func takePicker3sec(sender: AnyObject) {
      if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera) {
         let imagePicker = UIImagePickerController()
         imagePicker.delegate = self
         imagePicker.allowsEditing = true
         
         // 촬영 모드
         imagePicker.sourceType = UIImagePickerControllerSourceType.Camera
         
         
         self.presentViewController(imagePicker, animated: true, completion: { 
            NSTimer.scheduledTimerWithTimeInterval(3, target: imagePicker, selector:#selector(UIImagePickerController.takePicture), userInfo: nil, repeats: false)
         })
      }
      else {
         // 카메라 사용 불가 안내
      }
   }
   
   // 동영상 녹화
   @IBAction func recordMovie(sender: AnyObject) {
      if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera) {
         let imagePicker = UIImagePickerController()
         imagePicker.delegate = self
         imagePicker.sourceType = UIImagePickerControllerSourceType.Camera
         imagePicker.mediaTypes = [(kUTTypeMovie as String), (kUTTypeVideo as String)]
//         imagePicker.mediaTypes = ["public.movie"] // 이것도 가능. 어차피 문자열

         
         imagePicker.cameraCaptureMode = UIImagePickerControllerCameraCaptureMode.Video
         imagePicker.cameraDevice = .Front
         
         self.showViewController(imagePicker, sender: nil)
      }
   }
   func video(videoPath: String, didFinishSavingWithError error: NSError?, contextInfo info: UnsafeMutablePointer<Void>) {
      if error != nil {
         print("Video Save Error : ", error)
         return;
      }
      print("Video saved success : ", videoPath)
   }
   
   func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
      // 비디오 촬영
      if picker.sourceType == .Camera && picker.cameraCaptureMode == .Video {
         print(info)
         let url = info[UIImagePickerControllerMediaURL] as! NSURL
         
         
         UISaveVideoAtPathToSavedPhotosAlbum(url.absoluteString, self, #selector(ViewController.video(_:didFinishSavingWithError:contextInfo:)), nil)
      }
      // 카메라 앨범
      else {
         // Exif 정보 출력µ
         if let exif = info["Exif"] {
            print("EXIF")
            print(exif)
         }
         
         // 원본 이미지와 편집 이미지 모두
         let originalImage = info[UIImagePickerControllerOriginalImage] as! UIImage
         // 편집 이미지는 nil일 수도 있으므로 as?
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
      }
      
      picker.dismissViewControllerAnimated(true, completion: nil)
   }
}

