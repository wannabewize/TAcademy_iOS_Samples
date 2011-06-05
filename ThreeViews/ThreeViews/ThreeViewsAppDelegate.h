//
//  ThreeViewsAppDelegate.h
//  ThreeViews
//
//  Created by wannabewize_air on 3/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ThreeViewsViewController;

@interface ThreeViewsAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet ThreeViewsViewController *viewController;

@end
