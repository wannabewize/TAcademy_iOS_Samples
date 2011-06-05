//
//  LineView.m
//  BezierPathExercise
//
//  Created by wannabewize_air on 4/3/11.
//  Copyright 2011 iNEED. All rights reserved.
//

#import "LineView.h"


@implementation LineView


- (void)drawRect:(CGRect)rect {
	int y = 20;
	NSLog(@"drawing in LineView");
	[[UIColor redColor] setStroke];
	UIBezierPath *path;
	
	path = [UIBezierPath bezierPath];
	[path setLineWidth:7.0];
	[path moveToPoint:CGPointMake(20, y)];
	[path addLineToPoint:CGPointMake(280, y)];
	[path stroke];
	
	y+= 30;
	
	path = [UIBezierPath bezierPath];
	[[UIColor greenColor] setStroke];
	[path setLineWidth:7.0];
	[path moveToPoint:CGPointMake(20, y)];
	[path addLineToPoint:CGPointMake(280, y)];
	[path stroke];	
	
	y+= 30;
	
	path = [UIBezierPath bezierPath];		
	CGFloat pattern[] = { 10, 20, 30, 40};
	[[UIColor blueColor] setStroke];
	[path setLineWidth:7.0];
	[path setLineDash:pattern count:4 phase:0];
	[path moveToPoint:CGPointMake(20, y)];
	[path addLineToPoint:CGPointMake(280, y)];
	[path stroke];	
	
	y+= 40;
	path = [UIBezierPath bezierPath];		
	[[UIColor whiteColor] setStroke];
	[path setLineWidth:20.0];
	[path setLineCapStyle:kCGLineCapRound];	
	[path moveToPoint:CGPointMake(30, y)];
	[path addLineToPoint:CGPointMake(270, y)];
	[path stroke];	
	
	y+= 50;
	path = [UIBezierPath bezierPath];
	[[UIColor whiteColor] setStroke];
	[path setLineWidth:20.0];
	[path setLineJoinStyle:kCGLineJoinBevel];
	[path setLineCapStyle:kCGLineCapButt];
	[path moveToPoint:CGPointMake(20, y+120)];
	[path addLineToPoint:CGPointMake(150, y)];
	[path addLineToPoint:CGPointMake(270, y+120)];
	[path stroke];
	
	y+= 50;
	path = [UIBezierPath bezierPath];
	[[UIColor whiteColor] setStroke];
	[path setLineWidth:20.0];
	[path setLineJoinStyle:kCGLineJoinRound];
	[path setLineCapStyle:kCGLineCapRound];
	[path moveToPoint:CGPointMake(20, y+120)];
	[path addLineToPoint:CGPointMake(150, y)];
	[path addLineToPoint:CGPointMake(270, y+120)];	
	[path stroke];
	
	y+=50;
	path = [UIBezierPath bezierPath];
	[[UIColor whiteColor] setStroke];
	[path setLineWidth:20.0];
	[path setLineJoinStyle:kCGLineJoinMiter];
	[path setLineCapStyle:kCGLineCapSquare];
	[path moveToPoint:CGPointMake(20, y+120)];
	[path addLineToPoint:CGPointMake(150, y)];
	[path addLineToPoint:CGPointMake(270, y+120)];
	[path stroke];
}

@end
