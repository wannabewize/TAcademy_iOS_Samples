//
//  CurveView.m
//  BezierPathExercise
//
//  Created by wannabewize_air on 4/4/11.
//  Copyright 2011 iNEED. All rights reserved.
//

#import "CurveView.h"


@implementation CurveView

-(void)drawControlPoint:(CGPoint)point forColor:(UIColor *)color {
	UIBezierPath *controlPoint = [UIBezierPath bezierPathWithRect:CGRectMake(point.x-5, point.y-5, 10, 10)];
	[color setFill];
	[controlPoint fill];
}


-(void) drawRect:(CGRect)rect {
	UIBezierPath *path;
	CGPoint control1, control2;
	
	path = [UIBezierPath bezierPath];
	[path setLineWidth:4.0];
	[[UIColor whiteColor] setStroke];
	[path moveToPoint:CGPointMake(10, 80)];
	control1 = CGPointMake(100, 20);
	control2 = CGPointMake(200, 140);
	[path addCurveToPoint:CGPointMake(300, 80) controlPoint1:control1 controlPoint2:control2];		
	[self drawControlPoint:control1 forColor:[UIColor redColor]];
	[self drawControlPoint:control2 forColor:[UIColor redColor]];	
	
	
	[path moveToPoint:CGPointMake(10, 200)];
	control1 = CGPointMake(30, 130);
	control2 = CGPointMake(270, 270);
	[path addCurveToPoint:CGPointMake(300, 200) controlPoint1:control1 controlPoint2:control2];		
	[self drawControlPoint:control1 forColor:[UIColor greenColor]];
	[self drawControlPoint:control2 forColor:[UIColor greenColor]];	
	
	[path moveToPoint:CGPointMake(10, 350)];
	control1 = CGPointMake(30, 280);
	[path addQuadCurveToPoint:CGPointMake(140, 350) controlPoint:control1];
	[self drawControlPoint:control1 forColor:[UIColor blueColor]];
	
	[path moveToPoint:CGPointMake(160, 350)];
	control2 = CGPointMake(250, 400);
	[path addQuadCurveToPoint:CGPointMake(300, 350) controlPoint:control2];
	[self drawControlPoint:control2 forColor:[UIColor blueColor]];
	
	[path stroke];
	
}

@end
