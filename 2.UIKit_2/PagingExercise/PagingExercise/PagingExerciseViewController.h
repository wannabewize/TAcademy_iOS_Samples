//
//  PagingExerciseViewController.h
//  PagingExercise
//
//  Created by wannabewize on 3/23/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PagingExerciseViewController : UIViewController <UIScrollViewDelegate> {    
	IBOutlet UIScrollView *scrollView;
	IBOutlet UIPageControl *pageControl;
	int loadedPageCount;
}

@end
