
#import "BattleFieldLayer.h"
#import "Fighter.h"

#define Z_FIGHT 95
#define Z_PAD 96

#define TAG_ENEMY 1
#define TAG_BULLET 2

@implementation BattleFieldLayer

+(CCScene *) scene {
	CCScene *scene = [CCScene node];
	BattleFieldLayer *layer = [BattleFieldLayer node];
	[scene addChild: layer];
	return scene;
}

-(void)spriteMoveFinished:(id)sender {
	CCSprite *sprite = (CCSprite *)sender;
	if ( sprite.tag == TAG_ENEMY ) {
		[enemies removeObject:sprite];
	}
	else {
		[bullets removeObject:sprite];
	}
	[self removeChild:sprite cleanup:YES];
}

-(void)checkCollision {
	NSMutableArray *collisiedBullets = [NSMutableArray array];
	
	for (CCSprite *bullet in bullets) {
		
		NSMutableArray *shootedEnemy = [NSMutableArray array];
		
		for (CCSprite *enemy in enemies) {
			CGPoint enemyPoint = enemy.position;
			CGSize enemySize = enemy.contentSize;
			CGRect enemyRect = CGRectMake(enemyPoint.x - enemySize.width/2, enemyPoint.y-enemySize.height/2, enemySize.width, enemySize.height);
			
			CGPoint bulletPoint = bullet.position;
			CGSize bulletSize = bullet.contentSize;
			CGRect bulletRect = CGRectMake(bulletPoint.x - bulletSize.width/2, bulletPoint.y-bulletSize.height/2, bulletSize.width, bulletSize.height);
			
			if ( CGRectContainsRect(enemyRect, bulletRect) ) {
				[shootedEnemy addObject:enemy];
			}
		}
		
		// 총알에 맞은 적이 있으면 적을 삭제
		if ( [shootedEnemy count] > 0 ) {
			for (CCSprite *enemy in shootedEnemy) {
				[self removeChild:enemy cleanup:YES];
				[enemies removeObject:enemy];
			}
			[collisiedBullets addObject:bullet];
		}
	}
	
	// 총알 삭제
	if ( [collisiedBullets count] > 0 ) {
		for (CCSprite *bullet in collisiedBullets) {
			[self removeChild:bullet cleanup:YES];
			[bullets removeObject:bullet];
		}		
	}
}

// 총알 추가
-(void)shootTarget {	
	CCSprite *bullet = [CCSprite spriteWithFile:@"bullet.png"];
	bullet.tag = TAG_BULLET;
	
	// 처음 위치는 비행기 위치와 동일
	bullet.position = fighter.position;
	
	// 발사위치는 x좌표는 비행기 위치, y좌표는 화면 밖
	CGSize winsize = [[CCDirector sharedDirector] winSize];
	CGPoint dest = ccp(fighter.position.x, winsize.height + bullet.contentSize.height);
	
	[self addChild:bullet];
	[bullets addObject:bullet];
	
	// 발사-이동 액션과, 화면을 벗어나면 스프라이트 삭제 액션을 순차적으로 실행
	id actionFire = [CCMoveTo actionWithDuration:1.0 position:dest];
	id actionRemove = [CCCallFuncN actionWithTarget:self selector:@selector(spriteMoveFinished:)];
	[bullet runAction:[CCSequence actions:actionFire, actionRemove, nil]];
}

// 적 추가하기
-(void)addEnemy:(ccTime)dt {
	CCSprite *enemy = [CCSprite spriteWithFile:@"enemy.png"];
	enemy.tag = TAG_ENEMY;
	
	CGSize enemySize = enemy.contentSize;
	CGSize winSize = [[CCDirector sharedDirector] winSize];
	
	// 적의 초기 위치 - x좌표는 난수로, y좌표는 화면 상단
	int initY = winSize.height + enemySize.height;
	int initX = (arc4random() % (int)(winSize.width - enemySize.width) ) + enemySize.width / 2;
	
	// 적이 이동하는 위치 - x좌표는 난수, y좌표는 화면 하단
	int destY = - enemySize.height;	
	int destX = (arc4random() % (int)(winSize.width - enemySize.width) ) + enemySize.width / 2;
	
	enemy.position = ccp(initX, initY);	
	
	[self addChild:enemy];
	[enemies addObject:enemy];
	
	// 속도를 랜덤으로
	int minDuration = 2.0;
	int maxDuration = 4.0;
	int rangeDuration = maxDuration - minDuration;
	int actualDuration = (arc4random() % rangeDuration) + minDuration;
	
	// 액션 - 이동 액션이 끝나면 스프라이트 삭제 액션 동작
	id actionMove = [CCMoveTo actionWithDuration:actualDuration position:ccp(destX, destY)];
	id actionRemove = [CCCallFuncN actionWithTarget:self selector:@selector(spriteMoveFinished:)];
	[enemy runAction:[CCSequence actions:actionMove, actionRemove, nil]];
}



// 조이스틱 이동, 이동에 따라서 비행기의 각도와 속도 계산, 세팅
#define MAX_JOYBTN_DIST (joypad.contentSize.width / 2)
-(void)moveJoybtn:(UITouch *)touch {	
	// 터치 좌표
	CGPoint point = [self convertTouchToNodeSpace:touch];
	
	// 스틱과 터치간의 거리
	float dist = ccpDistance(point, joypad.position);
	if ( dist < MAX_JOYBTN_DIST ) {
		joybtn.position = point;
	}
	
	// 스틱의 포인트로 각도 계산
	CGPoint delta = ccpSub(point, joypad.position);
	float angle = ccpToAngle(delta);
	
	// 스틱과 중심의 거리 정도를 스피드로
	fighter.speed = (int)dist / MAX_JOYBTN_DIST * 5;
	fighter.direction = angle;	
}


// 터치가 조이스틱 영역 내부인지 체크
-(BOOL) isTouchingJoybtn:(UITouch*)touch {
	CGPoint touchPoint = [self convertTouchToNodeSpace:touch];
	return ccpDistance(joybtn.position, touchPoint) < (joybtn.contentSize.width / 2);
}

// 터치가 발사 버튼 터치 영역 내부인지 체크
-(BOOL) isTouchingFireBtn:(UITouch *)touch {
	CGPoint touchPoint = [self convertTouchToNodeSpace:touch];
	return ccpDistance(fireBtn.position, touchPoint) < (fireBtn.contentSize.width / 2);
}

// 멀티 터치 대응 : 조이스틱 터치 코드이면 처리
-(void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	for (UITouch *touch in [touches allObjects]) {
		if ( [self isTouchingJoybtn:touch] ) {
			isMovingJoybtn = YES;
		}		
	}
}

// 조이스틱 영역 내부에서 발생한 터치인지 비교, 처리
-(void)ccTouchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
	NSLog(@"touch count : %d", [touches count]);
	for (UITouch *touch in [touches allObjects]) {
		if ( [self isTouchingJoybtn:touch] && YES == isMovingJoybtn ) {
			[self moveJoybtn:touch];
		}		
	}
}

-(void)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	for (UITouch *touch in [touches allObjects]) {
		if ( [self isTouchingJoybtn:touch] && YES == isMovingJoybtn ) {
			joybtn.position = joypad.position;
			fighter.speed = 0;
			isMovingJoybtn = NO;
		}
		else if ( [self isTouchingFireBtn:touch] ) {
			[self shootTarget];
		}
	}	
}

-(id) init {
	if( (self=[super initWithColor:ccc4(8, 54, 129, 255)])) {	
		self.isTouchEnabled = YES;
		
		CGSize winsize = [[CCDirector sharedDirector] winSize];
		
		fighter = [Fighter fighter];
		fighter.position = ccp(winsize.width /2 , winsize.height/2);
		[self addChild:fighter z:Z_FIGHT];
		
		joypad = [CCSprite spriteWithFile:@"joypad.png"];
		joypad.position = ccp(70,70);
		[self addChild:joypad z:Z_PAD];
		
		joybtn = [CCSprite spriteWithFile:@"joybtn.png"];
		joybtn.position = ccp(70,70);
		[self addChild:joybtn z:Z_PAD+1];
		
		fireBtn = [CCSprite spriteWithFile:@"firebtn.png"];
		int x = winsize.width - (fireBtn.contentSize.width);
		fireBtn.position = ccp(x,70);
		[self addChild:fireBtn z:Z_PAD];
		
		enemies = [[NSMutableArray alloc] init];
		bullets = [[NSMutableArray alloc] init];
		
		[fighter schedule:@selector(move)];		
		[self schedule:@selector(addEnemy:) interval:1.0];
		[self schedule:@selector(checkCollision)];
	}
	return self;
}

- (void) dealloc {
	[enemies release];
	[bullets release];
	[super dealloc];
}

@end