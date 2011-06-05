//
//  EditableTableExerciseViewController.h
//  EditableTableExercise
//
//  Created by wannabewize_air on 4/8/11.
//  Copyright 2011 iNEED. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EditableTableExerciseViewController : UIViewController <UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource> {
    
	IBOutlet UITextField *contextTextField;
	IBOutlet UITableView *table;
	
	NSMutableArray *data;
}

- (IBAction)addItem:(id)sender;
- (IBAction)toggleEditMode:(id)sender;
-(void)saveData;

@end
