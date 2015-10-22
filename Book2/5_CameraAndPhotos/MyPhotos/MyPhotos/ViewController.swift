//
//  ViewController.swift
//  Photos
//
//  Created by wannabewize on 2015. 3. 27..
//  Copyright (c) 2015년 wannabewize. All rights reserved.
//

import UIKit
import Photos

class PhotoCell : UICollectionViewCell {
  @IBOutlet weak var imageView: UIImageView!
}

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
  var images = [UIImage]()
  
  @IBOutlet weak var collectionView: UICollectionView!
  
  @IBAction func showAllImages(sender: AnyObject) {
    // 권한 체크
    switch PHPhotoLibrary.authorizationStatus() {
    case PHAuthorizationStatus.NotDetermined:
      print("NotDetermined - 권한 요청")
      PHPhotoLibrary.requestAuthorization({ (status : PHAuthorizationStatus) -> Void in
        print("사용자가 접근 권한 결정함 : \(status)")
        if status == .Authorized {
          self.listAllImages()
        }
      })
    case PHAuthorizationStatus.Denied:
      // 앨범 접근 허가 필요. 사용자에게 권한 변경 요청
      let alert = UIAlertController(title: "설정에서 앨범 접근을 허용해 주세요.", message: nil, preferredStyle: UIAlertControllerStyle.Alert)
      let action = UIAlertAction(title: "확인", style: UIAlertActionStyle.Default, handler: nil)
      alert.addAction(action)
      self.showViewController(alert, sender: nil)
    case PHAuthorizationStatus.Authorized:
      // 앨범 접근 가능 - 앨범 접근 코드 작성
      self.listAllImages()
    case PHAuthorizationStatus.Restricted:
      // 앨범 접근 불가능 - 상태 알림
      let alert = UIAlertController(title: "앨범에서 사진을 가지고 올 수 없습니다.", message: nil, preferredStyle: UIAlertControllerStyle.Alert)
      let action = UIAlertAction(title: "확인", style: UIAlertActionStyle.Default, handler: nil)
      alert.addAction(action)
      self.showViewController(alert, sender: nil)

    }
  }
  
  func listAllImages() {
    // 이전 이미지 삭제
    images.removeAll(keepCapacity: false)
    
    // 모든 이미지 얻어도기
    let result : PHFetchResult = PHAsset.fetchAssetsWithMediaType(PHAssetMediaType.Image, options: nil)
    
    // 첫 사진 얻어서 정보 출력
    let asset = result.firstObject as! PHAsset
    let formatter = NSDateFormatter()
    formatter.dateStyle = NSDateFormatterStyle.ShortStyle
    let createDate = formatter.stringFromDate(asset.creationDate! )
    print("First : \(createDate)")
    
    // 이미지 순회
    result.enumerateObjectsUsingBlock { (obj : AnyObject!, idx : Int, stop : UnsafeMutablePointer<ObjCBool>) -> Void in
      let asset = obj as! PHAsset
      
      // 이미지를 얻기 위한 이미지 매니저
      let manager = PHImageManager.defaultManager()
      let size = CGSizeMake(100, 100)
      
      // 이미지 매니저에서 이미지 요청
      manager.requestImageForAsset(asset, targetSize: size, contentMode: PHImageContentMode.AspectFill, options: nil, resultHandler: { (image : UIImage?, info : [NSObject : AnyObject]?) -> Void in
        self.images.append(image!)
        
        // 콜렉션 뷰에 반영
        if result.count == self.images.count {
          print("added all image.");
          self.collectionView.reloadData()
        }
      })
    }
  }
  
  // 콜렉션 뷰 - 이미지 개수
  func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return images.count
  }
  
  // 콜렉션 뷰 셀
  func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCellWithReuseIdentifier("PHOTO_CELL", forIndexPath: indexPath) as! PhotoCell
    cell.imageView.image = images[indexPath.item]
    return cell
  }
  
  override func viewDidLoad() {
  }
}

