//
//  ImageGalleryViewController.m
//  ImageGallery
//
//  Created by wannabewize on 4/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ImageGalleryViewController.h"

#define IMAGE_COUNT 5

@implementation ImageGalleryViewController

- (void) showImage {
  NSString *strImageName = [NSString stringWithFormat:@"image%d.jpg", imageIndex];
	NSBundle *bundle = [NSBundle mainBundle];
	NSString *strPath = [[bundle resourcePath] stringByAppendingPathComponent:strImageName];	
	imageView.image = [UIImage imageWithContentsOfFile:strPath];

}
-(IBAction)changeImage:(id)sender {
	UIButton *button = (UIButton *)sender;
	
	if ( button.tag == 1 ) {
		imageIndex--;
	} else {
		imageIndex++;		
	}
	
	[self showImage];
	
	
	leftButton.enabled = (imageIndex > 0 );
	rightButton.enabled = (imageIndex < IMAGE_COUNT -1 );	
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
	
	[leftButton setImage:[UIImage imageNamed:@"left_1.png"] forState:UIControlStateNormal];
	[leftButton setImage:[UIImage imageNamed:@"left_2.png"] forState:UIControlStateDisabled];
	[rightButton setImage:[UIImage imageNamed:@"right_1.png"] forState:UIControlStateNormal];
	[rightButton setImage:[UIImage imageNamed:@"right_2.png"] forState:UIControlStateDisabled];
	
	[leftButton addTarget:self action:@selector(changeImage:) forControlEvents:UIControlEventTouchUpInside];
	[rightButton addTarget:self action:@selector(changeImage:) forControlEvents:UIControlEventTouchUpInside];
	leftButton.tag = 1;
	rightButton.tag = 2;
	
	leftButton.enabled = NO;
	imageIndex = 0;
	
	[self showImage];
}

- (void)viewDidUnload {
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft || interfaceOrientation == UIInterfaceOrientationLandscapeRight);
}

@end
