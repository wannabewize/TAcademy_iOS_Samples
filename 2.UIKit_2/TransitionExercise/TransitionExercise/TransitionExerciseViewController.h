//
//  TransitionExerciseViewController.h
//  TransitionExercise
//
//  Created by wannabewize on 3/30/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TransitionExerciseViewController : UIViewController {
	NSMutableArray *images;
	IBOutlet UIView *imageContainer;
	int currentImageIndex;
	BOOL transitionTypeFlip;
	UIView *currentView;
    
}
- (IBAction)changeImage:(id)sender;
- (IBAction)changeTransitionType:(id)sender;

@end
