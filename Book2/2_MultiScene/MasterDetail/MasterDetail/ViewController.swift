//
//  ViewController.swift
//  MasterDetail
//
//  Created by wannabewize on 2015. 3. 24..
//  Copyright (c) 2015년 VanillaStep. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  
  @IBOutlet weak var tableView: UITableView!
  
  var data = ["apple.com", "google.com", "skplanet.com", "daum.net", "naver.com"]
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return data.count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("URL_CELL", forIndexPath: indexPath) as! UITableViewCell
    
    cell.textLabel?.text = data[indexPath.row]

    return cell
  }

  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // 테이블 뷰의 셀 선택으로 세그웨이 전환시 - sender는 셀
    let cell = sender as! UITableViewCell
    // 셀에서 인덱스 - 사용자 선택 데이터 얻기
    let indexPath = tableView.indexPathForCell(cell)!
    let selected  = data[indexPath.row]
    
    println("사용자가 선택한 데이터 : \(selected)")
    
    let detailVC = segue.destinationViewController as! DetailViewController
    detailVC.urlStr = selected    
  }

  // 세그웨이를 이용하지 않고 상세 씬으로 전환시
  /*
  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    let detailVC = self.storyboard?.instantiateViewControllerWithIdentifier("DETAIL_VC") as DetailViewController
    
    let selected = data[indexPath.row]
    detailVC.urlStr = selected
    
    // 내비게이션 기반에서는 PUSH로 도작
    self.showViewController(detailVC, sender: nil)
  }
*/
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // 내비게이션 바와 테이블 뷰를 사용할 때, 여백생기는 것을 막음
    self.automaticallyAdjustsScrollViewInsets = false
  }
}

