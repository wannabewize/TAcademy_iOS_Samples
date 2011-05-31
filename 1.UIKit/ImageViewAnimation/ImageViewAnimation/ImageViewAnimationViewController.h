//
//  ImageViewAnimationViewController.h
//  ImageViewAnimation
//
//  Created by wannabewize on 3/23/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageViewAnimationViewController : UIViewController {
    
	IBOutlet UILabel *label;
	IBOutlet UIImageView *imageView;
}

- (IBAction)startAnimation:(id)sender;
- (IBAction)showInfo:(id)sender;

@end
