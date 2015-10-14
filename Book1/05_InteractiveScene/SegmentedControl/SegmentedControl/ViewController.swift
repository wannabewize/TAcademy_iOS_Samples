


import UIKit

class ViewController: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // png는 확장자 생략 가능, 옵셔널 체크 필요
    let rain = UIImage(named: "rain")!
//    let rain2 = rain.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
    let thunder = UIImage(named: "thunder")!
    let sun = UIImage(named: "sun")!

    // 배열
    let items = [rain, thunder, sun]
    
    let control = UISegmentedControl(items: items)
    control.frame = CGRectMake(20, 200, 300, 40)
    self.view.addSubview(control)
    
    control.addTarget(self, action: Selector("handleSegmentChange:"), forControlEvents: UIControlEvents.ValueChanged)
  }
  
  func handleSegmentChange(sender : AnyObject) {
    let control = sender as! UISegmentedControl
    switch control.selectedSegmentIndex {
    case 0:
      print("소나기")
    case 1:
      print("천둥,번개")
    default:
      print("맑음")
    }
  }
}

