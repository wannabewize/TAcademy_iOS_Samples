//
//  PopOverExerciseViewController.m
//  PopOverExercise
//
//  Created by wannabewize_air on 4/2/11.
//  Copyright 2011 iNEED. All rights reserved.
//

#import "PopOverExerciseViewController.h"
#import "PopOverContentViewController.h"

@implementation PopOverExerciseViewController

-(void)popoverControllerDidDismissPopover:(UIPopoverController *)popoverController {
	
}

-(BOOL)popoverControllerShouldDismissPopover:(UIPopoverController *)popoverController {
	return YES;
}

- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - View lifecycle


- (void)viewDidLoad {	
    [super viewDidLoad];
	PopOverContentViewController *popVC = [[PopOverContentViewController alloc] initWithNibName:@"PopOverContentViewController" bundle:nil];
	popOver = [[UIPopoverController alloc] initWithContentViewController:popVC];
	popOver.delegate = self;
	popOver.popoverContentSize = CGSizeMake(320, 280);	
	[popVC release];	
}

- (void)viewDidUnload {
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
}

- (IBAction)showPopOver:(id)sender {
	UIButton *button = (UIButton *)sender;
	
	[popOver presentPopoverFromRect:button.bounds inView:button permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
}

- (IBAction)showToolbarPopOver:(id)sender {
	UIBarButtonItem *button = (UIBarButtonItem *)sender;
	[popOver presentPopoverFromBarButtonItem:button permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
}
@end
