
#import "BattleFieldLayer.h"
#import "Fighter.h"

@implementation BattleFieldLayer

+(CCScene *) scene {
	CCScene *scene = [CCScene node];
	BattleFieldLayer *layer = [BattleFieldLayer node];
	[scene addChild: layer];
	return scene;
}

#define MAX_JOYBTN_DIST (joypad.contentSize.width / 2)
-(void)moveJoybtn:(UITouch *)touch {	
	// 터치 좌표
	CGPoint point = [self convertTouchToNodeSpace:touch];
	
	// 스틱과 터치간의 거리
	float dist = ccpDistance(point, joypad.position);
	if ( dist < MAX_JOYBTN_DIST ) {
		joybtn.position = point;
	}
	
	// 계속
	
	// 스틱의 포인트로 각도 계산
	CGPoint delta = ccpSub(point, joypad.position);
	float angle = ccpToAngle(delta);
	
	// 스틱과 중심의 거리 정도를 스피드로
	fighter.speed = (int)dist / MAX_JOYBTN_DIST * 5;
	fighter.direction = angle;	
}

-(void)registerWithTouchDispatcher {
	[[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:self priority:0 swallowsTouches:YES];
}

-(CGFloat) distanceFromJoypadSquared:(CGPoint)p {
	return ccpLengthSQ(ccpSub(p, joypad.position));
}

-(BOOL) isTouchingJoybtn:(UITouch*)touch {
	CGPoint touchPoint = [self convertTouchToNodeSpace:touch];
	return ccpDistance(joybtn.position, touchPoint) < (joybtn.contentSize.width / 2);
}


-(BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event {
	if ( [self isTouchingJoybtn:touch] ) {
		isMovingJoybtn = YES;
	}
	return YES;
}

-(void)ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event {
	if ( isMovingJoybtn )
		[self moveJoybtn:touch];
}

-(void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event {	
	joybtn.position = joypad.position;
	fighter.speed = 0;
	isMovingJoybtn = NO;
	
}


-(id) init {
	if( (self=[super initWithColor:ccc4(8, 54, 129, 255)])) {	
		self.isTouchEnabled = YES;
		
		CGSize winsize = [[CCDirector sharedDirector] winSize];
		
		fighter = [Fighter spriteWithFile:@"fighter.png"];
		fighter.position = ccp(winsize.width /2 , winsize.height/2);
		[self addChild:fighter];
		
		joypad = [CCSprite spriteWithFile:@"joypad.png"];
		joypad.position = ccp(70,70);
		[self addChild:joypad z:1];
		
		joybtn = [CCSprite spriteWithFile:@"joybtn.png"];
		joybtn.position = ccp(70,70);
		[self addChild:joybtn z:2];
		
		[fighter schedule:@selector(move)];
	}
	return self;
}

- (void) dealloc {
	[super dealloc];
}

@end