
#import "BattleFieldLayer.h"
#import "SimpleAudioEngine.h"
#import "Fighter.h"
#import "Enemy.h"

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
	// 적기이 폭발과 삭제는 Enemy에서 처리
	if ( sprite.tag == TAG_BULLET ) {
		[bullets removeObject:sprite];
	}
	[self removeChild:sprite cleanup:YES];
}

-(void)checkCollision {
	NSMutableArray *collidedBullets = [NSMutableArray array];
	
	for (CCSprite *bullet in bullets) {
		
		NSMutableArray *fallingEnemies = [NSMutableArray array];
		
		for (Enemy *enemy in enemies) {
			CGPoint enemyPoint = enemy.position;
			CGSize enemySize = enemy.contentSize;
			CGRect enemyRect = CGRectMake(enemyPoint.x - enemySize.width/2, enemyPoint.y-enemySize.height/2, enemySize.width, enemySize.height);
			
			CGPoint bulletPoint = bullet.position;
			CGSize bulletSize = bullet.contentSize;
			CGRect bulletRect = CGRectMake(bulletPoint.x - bulletSize.width/2, bulletPoint.y-bulletSize.height/2, bulletSize.width, bulletSize.height);
			
			// 충돌 체크 - 배열 순회중에는 삭제가 안되므로 임시 배열에 넣음
			if ( CGRectContainsRect(enemyRect, bulletRect) ) {
				[fallingEnemies addObject:enemy];
			}
		}
		
		// 총알에 맞은 적이 있으면 적을 삭제
		if ( [fallingEnemies count] > 0 ) {
			for (Enemy *enemy in fallingEnemies) {
				// 폭발 애니메이션과 목록에서 삭제
				[enemies removeObject:enemy];
				// 충돌 효과 - 스프라이트 시트 애니메이션 동작 후 삭제
				[enemy explode:explosionAni];
			}
			// 총알을 삭제 리스트에 추가
			[collidedBullets addObject:bullet];
		}
	}
	
	// 총알 삭제
	if ( [collidedBullets count] > 0 ) {
		for (CCSprite *bullet in collidedBullets) {
			[bullet stopAllActions];
			[self spriteMoveFinished:bullet];
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
	Enemy *enemy = [Enemy enemyIn:self];
	enemy.tag = TAG_ENEMY;
	[enemy move];
	
	[self addChild:enemy];
	[enemies addObject:enemy];
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
		
		// 폭발 스프라이트 시트를 로딩, 캐싱함
		[[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"explosion.plist"];
		NSMutableArray *explosionFrames = [NSMutableArray array];
		for(int i = 0 ; i < 7 ; i++ ) {
			NSString *frameName = [NSString stringWithFormat:@"explosion%d.png", i];
			CCSpriteFrame *frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:frameName];
			[explosionFrames addObject:frame];
		}

		// 스프라이트 시트를 이용한 애니메이션
		explosionAni = [[CCAnimation animationWithFrames:explosionFrames delay:0.1f] retain];
		
		enemies = [[NSMutableArray alloc] init];
		bullets = [[NSMutableArray alloc] init];
		
		[fighter schedule:@selector(move)];		
		[self schedule:@selector(addEnemy:) interval:1.0];
		[self schedule:@selector(checkCollision)];
		
		[[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"background-music-aac.caf"];
		
	}
	return self;
}

- (void) dealloc {
	[explosionAni release];
	[enemies release];
	[bullets release];
	[super dealloc];
}

@end