//
//  ScrollExerciseViewController.h
//  ScrollExercise
//
//  Created by wannabewize on 3/23/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScrollExerciseViewController : UIViewController <UIScrollViewDelegate> {
    
	IBOutlet UIScrollView *scrollView;
}
- (IBAction)fitToWidth:(id)sender;
- (IBAction)fitToHeight:(id)sender;
- (IBAction)sizeDouble:(id)sender;

@end
