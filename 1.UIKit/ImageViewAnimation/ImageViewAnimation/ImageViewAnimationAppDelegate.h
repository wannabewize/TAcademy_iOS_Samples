//
//  ImageViewAnimationAppDelegate.h
//  ImageViewAnimation
//
//  Created by wannabewize on 3/23/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ImageViewAnimationViewController;

@interface ImageViewAnimationAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet ImageViewAnimationViewController *viewController;

@end
