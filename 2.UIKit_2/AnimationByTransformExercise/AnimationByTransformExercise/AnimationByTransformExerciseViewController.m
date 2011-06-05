//
//  AnimationByTransformExerciseViewController.m
//  AnimationByTransformExercise
//
//  Created by wannabewize on 3/29/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AnimationByTransformExerciseViewController.h"

@implementation AnimationByTransformExerciseViewController

CGFloat DegreesToRadians(CGFloat degrees) {
	return degrees * M_PI / 180;
};


-(IBAction)series {
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
	[UIView setAnimationDuration:1.0];
	[UIView setAnimationDelegate:self];
	[UIView setAnimationDidStopSelector:@selector(series2)];
	
	imageView.transform = CGAffineTransformScale(imageView.transform, 1.0, 2.0);
	
	[UIView commitAnimations];
}

-(void)series2 {
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
	[UIView setAnimationDuration:1.0];
	[UIView setAnimationDelegate:self];
	[UIView setAnimationDidStopSelector:@selector(series3)];
	
	imageView.transform = CGAffineTransformScale(imageView.transform, 2.0, 1.0);

	[UIView commitAnimations];
}

-(void)series3 {
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
	[UIView setAnimationDuration:1.0];
	[UIView setAnimationDelegate:self];
	[UIView setAnimationDidStopSelector:@selector(series4)];
	
	imageView.transform = CGAffineTransformRotate(imageView.transform, DegreesToRadians(180));
	
	[UIView commitAnimations];
}

-(void)series4 {
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
	[UIView setAnimationDuration:1.0];
	
	imageView.transform = CGAffineTransformIdentity;	
	
	[UIView commitAnimations];
}


-(IBAction)rotate {
	[UIView beginAnimations:@"id_rotate" context:nil];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
	[UIView setAnimationDuration:1.0];
	
	imageView.transform = CGAffineTransformRotate(imageView.transform ,DegreesToRadians(180));
	
	[UIView commitAnimations];
}

-(IBAction)move {
	[UIView beginAnimations:@"id_move" context:nil];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
	[UIView setAnimationDuration:1.0];
	
	CGAffineTransform form = imageView.transform;
	CGAffineTransform newForm = CGAffineTransformTranslate(form, 30, 30);
	imageView.transform = newForm;	
	
	[UIView commitAnimations];
	
}

-(IBAction)resize {
	[UIView beginAnimations:@"id_resize" context:nil];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
	[UIView setAnimationDuration:1.0];
	
	CGAffineTransform form = imageView.transform;
	CGAffineTransform newForm = CGAffineTransformScale(form, 2.0, 2.0);
	imageView.transform = newForm;	
	
	[UIView commitAnimations];
}


- (void)dealloc {
	
	CGAffineTransform scale = CGAffineTransformMakeScale(2.0, 2.0);
	CGAffineTransform rotate = CGAffineTransformMakeRotation(M_PI);
	imageView.transform = CGAffineTransformConcat(scale, rotate);
	
    [super dealloc];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - View lifecycle


- (void)viewDidUnload {
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
