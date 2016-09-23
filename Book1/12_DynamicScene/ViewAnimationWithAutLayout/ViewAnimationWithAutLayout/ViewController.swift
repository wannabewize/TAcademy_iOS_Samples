
import UIKit

class ViewController: UIViewController {
   
   @IBOutlet weak var movingBlock : UIView!
   
   @IBOutlet weak var topConstraint: NSLayoutConstraint!
   @IBOutlet weak var leftConstraint: NSLayoutConstraint!
   
   @IBAction func moveBlock(sender: AnyObject) {
      UIView.animateWithDuration(1.0, animations: {
         let width = self.view.frame.size.width - self.movingBlock.frame.size.width
         let height = self.view.frame.height - self.movingBlock.frame.height - 44
         
         let x = arc4random_uniform(UInt32(width))
         let y = arc4random_uniform(UInt32(height))
         
         self.movingBlock.center = CGPointMake(CGFloat(x), CGFloat(y))
         
         }) { (finished) in
            self.topConstraint.constant = self.movingBlock.frame.origin.y - self.topLayoutGuide.length
            self.leftConstraint.constant = self.movingBlock.frame.origin.x
      }
   }
}

