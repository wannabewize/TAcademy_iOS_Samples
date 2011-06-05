//
//  MessageUIExerciseAppDelegate.h
//  MessageUIExercise
//
//  Created by wannabewize_air on 4/3/11.
//  Copyright 2011 iNEED. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MessageUIExerciseViewController;

@interface MessageUIExerciseAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet MessageUIExerciseViewController *viewController;

@end
