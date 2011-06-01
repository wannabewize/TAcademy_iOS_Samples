//
//  PagingExerciseAppDelegate.h
//  PagingExercise
//
//  Created by wannabewize on 3/23/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PagingExerciseViewController;

@interface PagingExerciseAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet PagingExerciseViewController *viewController;

@end
