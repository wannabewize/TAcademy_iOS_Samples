//
//  RectView.m
//  BezierPathExercise
//
//  Created by wannabewize_air on 4/3/11.
//  Copyright 2011 iNEED. All rights reserved.
//

#import "RectView.h"


@implementation RectView

- (void)drawRect:(CGRect)rect {
	UIBezierPath *path;
	[[UIColor whiteColor] setStroke];
	
	path = [UIBezierPath bezierPathWithRect:CGRectMake(10, 10, 300, 400)];
	[path setLineWidth:5.0];
	[path stroke];
	
	
	path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(30, 30, 260, 360) cornerRadius:5];
	[path setLineWidth:8.0];
	[path stroke];
	
	// 4개 코너
	
	path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(50, 50, 100, 100)
								 byRoundingCorners:UIRectCornerTopLeft cornerRadii:CGSizeMake(5,5)];
	[[UIColor whiteColor] setStroke];
	path.lineWidth = 5.0;
	[path stroke];
	
	path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(170, 50, 100, 100)
								 byRoundingCorners:UIRectCornerTopRight cornerRadii:CGSizeMake(20,5)];
	[[UIColor redColor] setStroke];
	path.lineWidth = 5.0;
	[path stroke];
	
	path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(50, 170, 100, 100)
								 byRoundingCorners:UIRectCornerBottomLeft cornerRadii:CGSizeMake(20,20)];
	[[UIColor greenColor] setStroke];
	path.lineWidth = 5.0;	
	[path stroke];
	
	path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(170, 170, 100, 100)
								 byRoundingCorners:UIRectCornerBottomRight cornerRadii:CGSizeMake(5,20)];
	[[UIColor blueColor] setStroke];
	path.lineWidth = 5.0;	
	[path stroke];	
	
	// 채우기
	path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(50, 280, 220, 90) cornerRadius:20];
	[[UIColor magentaColor] setStroke];
	[[UIColor orangeColor] setFill];
	[path fill];
	[path stroke];	
}



@end
