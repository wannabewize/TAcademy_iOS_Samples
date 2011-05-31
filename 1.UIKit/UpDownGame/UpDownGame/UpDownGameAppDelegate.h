//
//  UpDownGameAppDelegate.h
//  UpDownGame
//
//  Created by wannabewize_air on 4/11/11.
//  Copyright 2011 iNEED. All rights reserved.
//

#import <UIKit/UIKit.h>

@class UpDownGameViewController;

@interface UpDownGameAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet UpDownGameViewController *viewController;

@end
