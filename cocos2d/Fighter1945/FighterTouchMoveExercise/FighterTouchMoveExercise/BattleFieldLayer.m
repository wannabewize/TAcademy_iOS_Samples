//
//  HelloWorldLayer.m
//  FighterTouchMoveExercise
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

-(void)registerWithTouchDispatcher {
	[[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:self priority:0 swallowsTouches:YES];
}

-(BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event {
	return YES;
}

-(void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event {
	CGPoint point = [self convertTouchToNodeSpace:touch];
	// 액션을 이용해서 이동 애니메이션 효과
	CCMoveTo *move = [CCMoveTo actionWithDuration:1 position:point];
	[fighter runAction:move];
}

-(id) init {
	//CCLayerColor는 CCLayer의 서브 클래스로, 배경색상을 지정하면서 초기화
	if( (self=[super initWithColor:ccc4(8, 54, 129, 255)])) {		
		self.isTouchEnabled = YES;
		
		CGSize size = [[CCDirector sharedDirector] winSize];

		fighter = [CCSprite spriteWithFile:@"fighter.png"];
		fighter.position = ccp(size.width/2,size.height/2);
		
		[self addChild:fighter];
		
	}
	return self;
}

- (void) dealloc {
	[super dealloc];
}
@end
