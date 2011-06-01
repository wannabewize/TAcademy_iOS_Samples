//
//  FirstViewController.m
//  NavigationExercise
//
//  Created by wannabewize_air on 4/2/11.
//  Copyright 2011 iNEED. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"

@implementation FirstViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
		self.title = @"First";
    }
    return self;
}

- (void)dealloc {
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewDidUnload {
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)goSecond:(id)sender {
	SecondViewController *second = [[SecondViewController alloc] initWithNibName:@"SecondViewController" bundle:nil];
	[self.navigationController pushViewController:second animated:YES];
	[second release];
}

- (IBAction)goThird:(id)sender {
	ThirdViewController *third = [[ThirdViewController alloc] initWithNibName:@"ThirdViewController" bundle:nil];
	[self.navigationController pushViewController:third animated:YES];
	[third release];
}

@end
