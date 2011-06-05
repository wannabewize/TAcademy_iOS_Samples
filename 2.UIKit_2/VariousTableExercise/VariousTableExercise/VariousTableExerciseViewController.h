//
//  VariousTableExerciseViewController.h
//  VariousTableExercise
//
//  Created by wannabewize_air on 6/1/11.
//  Copyright 2011 iNEED. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VariousTableExerciseViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {
	NSArray *data1, *data2, *data3, *data4;
	NSArray *sectionHeaders;
}

@end
