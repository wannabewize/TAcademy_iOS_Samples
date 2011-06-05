//
//  ScrollExerciseViewController.m
//  ScrollExercise
//
//  Created by wannabewize on 3/23/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ScrollExerciseViewController.h"

@implementation ScrollExerciseViewController

- (void)dealloc {
	[scrollView release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - View lifecycle


#define TAG_CONTENT 99
- (void)viewDidLoad {
    [super viewDidLoad];
	
	NSString *filePath = [[NSBundle mainBundle] pathForResource:@"kiss" ofType:@"jpg"];
	UIImage *image = [UIImage imageWithContentsOfFile:filePath];
	UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
	imageView.tag = TAG_CONTENT;
	
	[scrollView addSubview:imageView];
	scrollView.delegate = self;
	scrollView.contentSize = imageView.frame.size;
	scrollView.minimumZoomScale = scrollView.frame.size.width / imageView.frame.size.width;
	
	[imageView release];
}

-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
	return [self.view viewWithTag:TAG_CONTENT];
}

- (void)viewDidUnload {
	[scrollView release];
	scrollView = nil;
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)fitToWidth:(id)sender {
	UIView *contentView = [self.view viewWithTag:TAG_CONTENT];
	float scale = scrollView.frame.size.width / contentView.frame.size.width;
	NSLog(@"scale : %f", scale);
	[scrollView setZoomScale:scale animated:YES];
}

- (IBAction)fitToHeight:(id)sender {
	UIView *contentView = [self.view viewWithTag:TAG_CONTENT];
	float scale = scrollView.frame.size.height / contentView.frame.size.height;
	NSLog(@"scale : %f", scale);
	[scrollView setZoomScale:scale animated:YES];	
}

- (IBAction)sizeDouble:(id)sender {
	float x = scrollView.contentOffset.x;
	float y = scrollView.contentOffset.y;
	float w = scrollView.frame.size.width / 2;
	float h = scrollView.frame.size.height / 2;
	
	CGRect doubleRect = CGRectMake(x, y, w, h);
	
	[scrollView zoomToRect:doubleRect animated:YES];
}

@end
