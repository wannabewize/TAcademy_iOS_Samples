//
//  OvalView.m
//  BezierPathExercise
//
//  Created by wannabewize_air on 4/3/11.
//  Copyright 2011 iNEED. All rights reserved.
//

#import "OvalView.h"


@implementation OvalView


- (void)drawRect:(CGRect)rect {
	UIBezierPath *path;
	
	path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(10, 10, 300, 400)];
	[[UIColor whiteColor] setStroke];	
	[path setLineWidth:6.0];
	[path stroke];
	
	path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(20, 80, 280, 260)];
	[[UIColor redColor] setStroke];
	[[UIColor lightGrayColor] setFill];
	CGFloat pattern[] = {10,10};
	[path setLineDash:pattern count:2 phase:0];
	[path setLineWidth:8.0];
	[path fill];
	[path stroke];
	
	path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(30, 140, 260, 130)];
	[[UIColor blueColor] setStroke];
	[[UIColor yellowColor] setFill];
	[path setLineWidth:3.0];
	[path fillWithBlendMode:kCGBlendModeScreen alpha:0.7];
	[path strokeWithBlendMode:kCGBlendModePlusDarker alpha:0.9];
	
	path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(100, 20, 120, 380)];
	[[UIColor greenColor] setStroke];
	[[UIColor yellowColor] setFill];
	[path setLineWidth:3.0];
	[path fillWithBlendMode:kCGBlendModeOverlay alpha:0.7];
	[path stroke];
}

- (void)dealloc {
    [super dealloc];
}

@end
