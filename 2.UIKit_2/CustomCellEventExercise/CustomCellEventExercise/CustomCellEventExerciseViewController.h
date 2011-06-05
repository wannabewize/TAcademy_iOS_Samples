//
//  CustomCellEventExerciseViewController.h
//  CustomCellEventExercise
//
//  Created by wannabewize_air on 4/13/11.
//  Copyright 2011 iNEED. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomCellDelegate.h"

@interface CustomCellEventExerciseViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, CustomCellDelegate, CartItemCellDelegate> {
    NSArray *products;
	NSMutableArray *cart;
	NSMutableDictionary *cartMap;
	
	IBOutlet UITableView *productTable;
}

@end
