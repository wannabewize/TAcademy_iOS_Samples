//
//  ThreeViewsViewController.m
//  ThreeViews
//
//  Created by wannabewize_air on 3/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ThreeViewsViewController.h"

@implementation ThreeViewsViewController

- (void)dealloc {
    [super dealloc];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - View lifecycle


- (void)viewDidLoad {
    [super viewDidLoad];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
