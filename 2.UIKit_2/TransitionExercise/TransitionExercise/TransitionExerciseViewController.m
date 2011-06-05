//
//  TransitionExerciseViewController.m
//  TransitionExercise
//
//  Created by wannabewize on 3/30/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TransitionExerciseViewController.h"

#define LEFT_BUTTON 98
#define RIGHT_BUTTON 99
#define IMAGE_COUNT 4


@implementation TransitionExerciseViewController

- (void)dealloc {
    [imageContainer release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - View lifecycle


- (void)viewDidLoad {
    [super viewDidLoad];
	images = [[NSMutableArray alloc] initWithCapacity:4];
	for (int i = 0; i < IMAGE_COUNT; i++) {
		UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"image%d", i]]];
		[images addObject:imageView];
		[imageView release];
	}

	currentImageIndex = 0;
	[imageContainer addSubview:[images objectAtIndex:currentImageIndex]];
}


- (void)viewDidUnload {
    [imageContainer release];
    imageContainer = nil;
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)changeImage:(id)sender {
	NSLog(@"changing Image");
	
	BOOL leftMove = ((UIView *)sender).tag == LEFT_BUTTON;
	int newIndex = leftMove ? ( currentImageIndex - 1 + IMAGE_COUNT ) % IMAGE_COUNT : (currentImageIndex + 1 ) % IMAGE_COUNT;	
	
	UIViewAnimationTransition transitionEffect;
	if ( transitionTypeFlip )
		transitionEffect = leftMove ? UIViewAnimationTransitionFlipFromLeft: UIViewAnimationTransitionFlipFromRight;
	else
		transitionEffect = leftMove ? UIViewAnimationTransitionCurlUp: UIViewAnimationTransitionCurlDown;
	
	
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:0.7];
	[UIView setAnimationTransition:transitionEffect forView:imageContainer cache:YES];
	
	[currentView removeFromSuperview];
	currentView = [images objectAtIndex:newIndex];
	[imageContainer addSubview:currentView];
	
	[UIView commitAnimations];
	currentImageIndex = newIndex;	
	
}


- (IBAction)changeTransitionType:(id)sender {
	transitionTypeFlip = !transitionTypeFlip;
	((UIBarButtonItem *)sender).title = transitionTypeFlip ? @"Curl" : @"Flip";

}

@end
