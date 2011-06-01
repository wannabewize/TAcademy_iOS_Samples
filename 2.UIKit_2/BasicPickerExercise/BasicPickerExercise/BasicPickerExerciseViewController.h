//
//  BasicPickerExerciseViewController.h
//  BasicPickerExercise
//
//  Created by wannabewize_air on 4/12/11.
//  Copyright 2011 iNEED. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BasicPickerExerciseViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource> {    
	IBOutlet UILabel *label;
	NSArray *data1, *data2;
}

@end
