//
//  EditableTableExerciseAppDelegate.h
//  EditableTableExercise
//
//  Created by wannabewize_air on 4/8/11.
//  Copyright 2011 iNEED. All rights reserved.
//

#import <UIKit/UIKit.h>

@class EditableTableExerciseViewController;

@interface EditableTableExerciseAppDelegate : NSObject <UIApplicationDelegate> {

}

-(NSString *)getDocumentPath:(NSString *)fileName;

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet EditableTableExerciseViewController *viewController;

@end
