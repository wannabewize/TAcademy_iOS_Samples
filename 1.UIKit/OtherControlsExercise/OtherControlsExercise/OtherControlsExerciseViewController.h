//
//  OtherControlsExerciseViewController.h
//  OtherControlsExercise
//
//  Created by wannabewize on 3/23/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OtherControlsExerciseViewController : UIViewController <UITextFieldDelegate> {
    
	IBOutlet UILabel *label;
	IBOutlet UISlider *redSlider;	
	IBOutlet UISlider *blueSlider;
	IBOutlet UISlider *greenSlider;
	
	IBOutlet UITextField *userInputField;
	IBOutlet UIView *colorView;
	UIActivityIndicatorView *activityIndicator;
}
- (IBAction)onColorSliderChanged:(id)sender;

- (IBAction)powerOnOff:(id)sender;

@end
