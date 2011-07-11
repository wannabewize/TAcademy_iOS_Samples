//
//  Fighter.m
//  FighterJoysticMoveExercise
//
//  Created by wannabewize on 6/14/11.
//  Copyright 2011 iNEED. All rights reserved.
//

#import "Fighter.h"


@implementation Fighter

@synthesize direction, speed;

-(void)move {
	if ( speed == 0 )
		return;
	
	// 속도와 방향을 계산
	CGPoint dxdy = ccpMult(ccpForAngle(direction), speed);
	// 현 위치에 속도와 방향을 계산한 만큼 더함
	CGPoint newPosition = ccpAdd(self.position, dxdy);
	
	CGRect window;
	window.origin = ccp(0,0);
	window.size = [[CCDirector sharedDirector] winSize];
	
	if ( CGRectContainsPoint(window, newPosition) )
		self.position = newPosition;
}

@end