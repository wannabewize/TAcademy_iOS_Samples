//
//  BezierPathExerciseViewController.m
//  BezierPathExercise
//
//  Created by wannabewize_air on 4/3/11.
//  Copyright 2011 iNEED. All rights reserved.
//

#import "BezierPathExerciseViewController.h"
#import "LineView.h"
#import "RectView.h"
#import "OvalView.h"
#import "ArcView.h"
#import "CurveView.h"

@implementation BezierPathExerciseViewController

- (void)changeDrawing:(id)sender {
	NSInteger index = ((UISegmentedControl *)sender).selectedSegmentIndex;
	NSLog(@"changeDrawing : %d", index);
	[self.view addSubview:[drawings objectAtIndex:index]];
}


- (void)dealloc {
    [super dealloc];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - View lifecycle

#define TOOLBAR_HEIGHT 44
- (void)viewDidLoad {
    [super viewDidLoad];
	
	UIToolbar *toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, TOOLBAR_HEIGHT)];
	toolBar.tintColor = [UIColor grayColor];

	CGRect contentRect = CGRectMake(0, TOOLBAR_HEIGHT, self.view.frame.size.width, self.view.frame.size.height - TOOLBAR_HEIGHT);	
	LineView *lineView = [[LineView alloc] initWithFrame:contentRect];
	RectView *rectView = [[RectView alloc] initWithFrame:contentRect];
	OvalView *ovalView = [[OvalView alloc] initWithFrame:contentRect];
	ArcView *arcView = [[ArcView alloc] initWithFrame:contentRect];
	CurveView *curveView = [[CurveView alloc] initWithFrame:contentRect];
	
	drawings = [[NSArray alloc] initWithObjects:lineView, rectView, ovalView, arcView, curveView, nil];
	NSArray *names = [NSArray arrayWithObjects:@"선", @"사각형", @"타원", @"호", @"곡선", nil];
	
	UISegmentedControl *viewSelector = [[UISegmentedControl alloc] initWithItems:names];
	viewSelector.segmentedControlStyle = UISegmentedControlStyleBar;
	viewSelector.tintColor = [UIColor purpleColor];
	[viewSelector addTarget:self action:@selector(changeDrawing:) forControlEvents:UIControlEventValueChanged];

	UIBarButtonItem *leftSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
	UIBarButtonItem *rightSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
	UIBarButtonItem *center = [[UIBarButtonItem alloc] initWithCustomView:viewSelector];
	center.width = 250.0;
	
	toolBar.items = [NSArray arrayWithObjects:leftSpace, center, rightSpace, nil];
	[self.view addSubview:toolBar];
	
	[leftSpace release];
	[center release];
	[rightSpace release];
	[viewSelector release];
}

- (void)viewDidUnload {
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


@end
