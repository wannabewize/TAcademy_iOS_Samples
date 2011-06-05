//
//  AlertActoinSheetExerciseViewController.m
//  AlertActoinSheetExercise
//
//  Created by wannabewize on 3/26/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AlertActoinSheetExerciseViewController.h"

@implementation AlertActoinSheetExerciseViewController

- (void)dealloc {
    [label release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - View lifecycle


- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewDidUnload {
    [label release];
    label = nil;
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)showAlert:(id)sender {
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"제목" message:@"메세지" delegate:self cancelButtonTitle:@"취소" otherButtonTitles:@"확인1", @"확인2", nil];
	[alert autorelease];
	[alert show];
}

- (IBAction)showActionSheet:(id)sender {
	UIActionSheet *action = [[UIActionSheet alloc]initWithTitle:@"제목" delegate:self cancelButtonTitle:@"취소" destructiveButtonTitle:@"삭제" otherButtonTitles:@"확인1", @"확인2", nil];
	[action autorelease];
	[action showInView:self.view];
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
	if ( buttonIndex == actionSheet.cancelButtonIndex ) {
		label.text = @"ActionSheet : 취소 선택";
	}
	else if ( buttonIndex == actionSheet.destructiveButtonIndex ) {
		label.text = @"ActionSheet : 삭제 선택";
	}
	else {
		label.text = [NSString stringWithFormat:@"ActionSheet : %@ 선택", [actionSheet buttonTitleAtIndex:buttonIndex]];
	}
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
	if ( buttonIndex == alertView.cancelButtonIndex ) {
		label.text = @"AlertView : 취소";
	}
	else {
		label.text = [NSString stringWithFormat:@"AlertView : %@ 선택", [alertView buttonTitleAtIndex:buttonIndex]];
	}
	
}
@end
