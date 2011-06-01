//
//  TouchExerciseViewController.m
//  TouchExercise
//
//  Created by wannabewize_air on 4/22/11.
//  Copyright 2011 iNEED. All rights reserved.
//

#import "TouchExerciseViewController.h"

@implementation TouchExerciseViewController

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	UITouch *touch = [touches anyObject];
	CGPoint point = [touch locationInView:self.view];
	if ( CGRectContainsPoint(ballImage.frame, point) ) {
		holdingImage = YES;
		ballImage.transform = CGAffineTransformMakeScale(1.2, 1.2);
	}
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
	if ( holdingImage ) {
		UITouch *touch = [touches anyObject];
		CGPoint point = [touch locationInView:self.view];
		ballImage.center = point;
	}
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	if ( holdingImage ) {
		ballImage.transform = CGAffineTransformIdentity;
		holdingImage = NO;
	}
}

- (void)dealloc {
    [super dealloc];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
	self.view.backgroundColor = [UIColor colorWithRed:0.4 green:0.7 blue:0.4 alpha:1.0];
	ballImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"image.png"]];
	ballImage.center = self.view.center;
	[self.view addSubview:ballImage];
	[ballImage release];
}

- (void)viewDidUnload {
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
