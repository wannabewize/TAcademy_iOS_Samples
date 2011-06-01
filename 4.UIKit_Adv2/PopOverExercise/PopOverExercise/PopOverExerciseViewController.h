//
//  PopOverExerciseViewController.h
//  PopOverExercise
//
//  Created by wannabewize_air on 4/2/11.
//  Copyright 2011 iNEED. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PopOverExerciseViewController : UIViewController <UIPopoverControllerDelegate> {
	UIPopoverController *popOver;
}

- (IBAction)showPopOver:(id)sender;
- (IBAction)showToolbarPopOver:(id)sender;

@end
