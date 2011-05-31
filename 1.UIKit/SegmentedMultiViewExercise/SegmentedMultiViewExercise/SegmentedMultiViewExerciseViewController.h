//
//  SegmentedMultiViewExerciseViewController.h
//  SegmentedMultiViewExercise
//
//  Created by wannabewize on 3/23/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SegmentedMultiViewExerciseViewController : UIViewController {
    
	IBOutlet UIView *contentsContainer;
	IBOutlet UISegmentedControl *pageChangeControl;
	IBOutlet UIView *first, *second, *third;
	UIView *currentView;
	int currentViewIndex;
}

- (IBAction)onSegmentChanged:(id)sender;

@end
