//
//  ArcView.m
//  BezierPathExercise
//
//  Created by wannabewize_air on 4/3/11.
//  Copyright 2011 iNEED. All rights reserved.
//

#import "ArcView.h"


@implementation ArcView

- (void)drawRect:(CGRect)rect {
	UIBezierPath *path;
	
	path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(150, 220) radius:140.0 startAngle:(3 * M_PI / 2) endAngle:(M_PI/2) clockwise:NO];
	[[UIColor whiteColor] setStroke];
	[path setLineWidth:4.0];	
	[path stroke];
	
	path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(170, 220) radius:140.0 startAngle:(3 * M_PI / 2) endAngle:(M_PI/2) clockwise:YES];
	[[UIColor whiteColor] setStroke];
	[path setLineWidth:4.0];	
	[path stroke];
	
	
	path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(85, 220) radius:75.0 startAngle:M_PI endAngle:(2*M_PI) clockwise:NO];
	[[UIColor redColor] setStroke];
	[path setLineWidth:4.0];	
	[path stroke];
	
	path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(235, 220) radius:75.0 startAngle:M_PI endAngle:(2*M_PI) clockwise:YES];
	[[UIColor blueColor] setStroke];
	[path setLineWidth:4.0];	
	[path stroke];
}

@end
