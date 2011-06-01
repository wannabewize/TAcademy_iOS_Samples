//
//  TableCustomCellExerciseViewController.h
//  TableCustomCellExercise
//
//  Created by wannabewize on 3/31/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableCustomCellExerciseViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {
	IBOutlet UITableView *productTable;
	NSArray *products;
}

@end
