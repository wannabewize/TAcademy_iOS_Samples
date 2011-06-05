//
//  BasicPickerExerciseAppDelegate.h
//  BasicPickerExercise
//
//  Created by wannabewize_air on 4/12/11.
//  Copyright 2011 iNEED. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BasicPickerExerciseViewController;

@interface BasicPickerExerciseAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet BasicPickerExerciseViewController *viewController;

@end
