//
//  GestureExerciseViewController.m
//  GestureExercise
//
//  Created by wannabewize_air on 4/22/11.
//  Copyright 2011 iNEED. All rights reserved.
//

#import "GestureExerciseViewController.h"

@implementation GestureExerciseViewController

- (void)dealloc {
	[ballImage release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)handleRotate:(UIRotationGestureRecognizer *)gesture {
	ballImage.transform = CGAffineTransformRotate(ballImage.transform, gesture.rotation);
	[gesture setRotation:0.0];
}

-(void)handlePan:(UIPanGestureRecognizer *)gesture {
	CGPoint point = [gesture locationInView:self.view];
	ballImage.center = point;
}

-(void)handlePinch:(UIPinchGestureRecognizer *)gesture {
	CGFloat scale = gesture.scale;
	ballImage.transform = CGAffineTransformScale(ballImage.transform, scale, scale);
	[gesture setScale:1.0];
}

- (void)viewDidLoad {
    [super viewDidLoad];
	self.view.backgroundColor = [UIColor colorWithRed:0.4 green:0.7 blue:0.4 alpha:1.0];
	
	// 이미지를 코드로 추가할 경우
	ballImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"image.png"]];
	ballImage.frame = CGRectMake(0, 0, 100, 100);
	ballImage.center = self.view.center;
	[self.view addSubview:ballImage];
	ballImage.userInteractionEnabled = YES;	
	[ballImage release];	
	
	UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
	[ballImage addGestureRecognizer:pan];
	[pan release];
	
	UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(handlePinch:)];
	[ballImage addGestureRecognizer:pinch];
	[pinch release];
	
	UIRotationGestureRecognizer *rotate = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(handleRotate:)];
	[ballImage addGestureRecognizer:rotate];
	[rotate release];
}


- (void)viewDidUnload {
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
