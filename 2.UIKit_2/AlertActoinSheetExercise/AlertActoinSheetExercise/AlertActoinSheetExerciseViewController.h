//
//  AlertActoinSheetExerciseViewController.h
//  AlertActoinSheetExercise
//
//  Created by wannabewize on 3/26/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AlertActoinSheetExerciseViewController : UIViewController <UIAlertViewDelegate, UIActionSheetDelegate> {
    
	IBOutlet UILabel *label;
}
- (IBAction)showAlert:(id)sender;
- (IBAction)showActionSheet:(id)sender;

@end
