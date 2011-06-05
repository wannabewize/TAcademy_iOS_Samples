//
//  TouchExerciseAppDelegate.h
//  TouchExercise
//
//  Created by wannabewize_air on 4/22/11.
//  Copyright 2011 iNEED. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TouchExerciseViewController;

@interface TouchExerciseAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet TouchExerciseViewController *viewController;

@end
