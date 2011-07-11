//
//  HelloWorldLayer.m
//  FighterSensorMoveExercise
//
//  Created by wannabewize on 6/14/11.
//  Copyright iNEED 2011. All rights reserved.
//


// Import the interfaces
#import "BattleFieldLayer.h"

@implementation BattleFieldLayer

+(CCScene *) scene {
	CCScene *scene = [CCScene node];
	BattleFieldLayer *layer = [BattleFieldLayer node];
	[scene addChild: layer];
	return scene;
}

#define WEIGHT 10
-(void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration {
	CGPoint currentPoint = fighter.position;
	
	NSLog(@"x:%f y:%f z:%f", acceleration.x, acceleration.y, acceleration.z);
	
	CGPoint delta = CGPointMake(- acceleration.y * WEIGHT, acceleration.x * WEIGHT);
	
	CGPoint newPosition = ccpAdd(currentPoint,delta);
	
	CGRect window;
	window.size = [[CCDirector sharedDirector] winSize];
	window.origin = CGPointMake(0, 0);
	
	if ( CGRectContainsPoint(window, newPosition) ) {
		fighter.position = newPosition;
	}
}


-(id) init {
	if( (self=[super initWithColor:ccc4(8, 54, 129, 255)])) {		
		self.isTouchEnabled = YES;
		
		CGSize size = [[CCDirector sharedDirector] winSize];
		
		fighter = [CCSprite spriteWithFile:@"fighter.png"];
		fighter.position = ccp(size.width/2,size.height/2);
		
		[self addChild:fighter];

		// 센서 초기화
		self.isAccelerometerEnabled = YES;		
		[[UIAccelerometer sharedAccelerometer] setDelegate:self];
	}
	return self;
}

- (void) dealloc {
	[super dealloc];
}
@end