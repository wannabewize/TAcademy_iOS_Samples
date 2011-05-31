//
//  ImageViewAnimationViewController.m
//  ImageViewAnimation
//
//  Created by wannabewize on 3/23/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ImageViewAnimationViewController.h"

@implementation ImageViewAnimationViewController

-(void)startAnimation:(id)sender {
	if ( [imageView isAnimating] ) {
		[imageView stopAnimating];
		[((UIButton *)sender) setTitle:@"Start Animation" forState:UIControlStateNormal];
	} else {
		[imageView startAnimating];
		[((UIButton *)sender) setTitle:@"Stop Animation" forState:UIControlStateNormal];
	}
}

- (void)showInfo:(id)sender {
	CGRect frame = imageView.frame;
	NSString *infoStr = [NSString stringWithFormat:@"UIImageView's Info\nFrame.origin : %3.0f,%3.f\nFrame.size : %3.f,%3.f\nTag : %d", frame.origin.x, frame.origin.y, frame.size.width, frame.size.height, imageView.tag];
	label.text = infoStr;
}


- (void)dealloc
{
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
	
	NSMutableArray *images = [NSMutableArray arrayWithCapacity:8];
	for (int i = 1; i <= 8; i++) {
		NSString *fileName = [NSString stringWithFormat:@"snsd%d.png", i];
		UIImage *image = [UIImage imageNamed:fileName];
		[images addObject:image];
	}
	imageView.animationDuration = 20;
	imageView.animationImages = images;
	imageView.tag = 99;
	
	label.numberOfLines = 0;	
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
