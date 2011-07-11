//
//  AppDelegate.h
//  FighterSensorMoveExercise
//
//  Created by wannabewize on 6/14/11.
//  Copyright iNEED 2011. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RootViewController;

@interface AppDelegate : NSObject <UIApplicationDelegate> {
	UIWindow			*window;
	RootViewController	*viewController;
}

@property (nonatomic, retain) UIWindow *window;

@end
