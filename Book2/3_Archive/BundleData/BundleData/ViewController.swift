import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
   
   var idols : NSDictionary!
   
   func numberOfSectionsInTableView(tableView: UITableView) -> Int {
      return idols.count
   }
   
   func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      let key = idols.allKeys[section] as! String
      let members = idols[key] as! [String]
      return members.count
   }
   
   func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCellWithIdentifier("IDOL_CELL", forIndexPath: indexPath)
      
      let key = idols.allKeys[indexPath.section] as! String
      let members = idols[key] as! [String]
      cell.textLabel!.text = members[indexPath.row]
      return cell
   }
   
   func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
      let key = idols.allKeys[section] as! String
      return key
   }
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      // 도큐먼트 폴더에 데이터 파일 존재 확인 - 없으면 처음 앱 실행
      let docPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true).first!
      let dataPath = "\(docPath)/idols.plist"
      let fm = NSFileManager.defaultManager()
      // 도큐먼트 폴더에 파일이 없으면 번들에서 복사
      if !fm.fileExistsAtPath(dataPath) {
         
         let path = NSBundle.mainBundle().pathForResource("idols", ofType: "plist")!
         
         // TODO - 에러 처리
         try! fm.copyItemAtPath(path, toPath: dataPath)
         print("초기 데이터 복사")
      }
      
      idols = NSDictionary(contentsOfFile: dataPath)
      print(idols)

   }
}

