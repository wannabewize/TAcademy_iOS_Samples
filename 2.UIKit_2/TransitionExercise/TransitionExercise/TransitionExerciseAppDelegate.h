//
//  TransitionExerciseAppDelegate.h
//  TransitionExercise
//
//  Created by wannabewize on 3/30/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TransitionExerciseViewController;

@interface TransitionExerciseAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet TransitionExerciseViewController *viewController;

@end
