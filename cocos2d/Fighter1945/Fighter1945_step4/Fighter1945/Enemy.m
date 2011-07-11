//
//  Enemy.m
//  Fighter1945
//
//  Created by wannabewize_air on 6/14/11.
//  Copyright 2011 iNEED. All rights reserved.
//

#import "Enemy.h"
#import "BattleFieldLayer.h"
#import "SimpleAudioEngine.h"

@implementation Enemy
@synthesize battleField;

+(id)enemyIn:(BattleFieldLayer *)layer {
	Enemy *enemy = [super spriteWithFile:@"enemy.png"];
	enemy.battleField = layer;
	return enemy;
}

-(void)removeEnemy {
	[self.battleField removeChild:self cleanup:YES];
}

-(void)move {
	CGSize enemySize = self.contentSize;
	CGSize winSize = [[CCDirector sharedDirector] winSize];
	
	// 적의 초기 위치 - x좌표는 난수로, y좌표는 화면 상단
	int initY = winSize.height + enemySize.height;
	int initX = (arc4random() % (int)(winSize.width - enemySize.width) ) + enemySize.width / 2;
	
	// 적이 이동하는 위치 - x좌표는 난수, y좌표는 화면 하단
	int destY = - enemySize.height;	
	int destX = (arc4random() % (int)(winSize.width - enemySize.width) ) + enemySize.width / 2;
	
	self.position = ccp(initX, initY);	
	
	// 속도를 랜덤으로
	int minDuration = 2.0;
	int maxDuration = 4.0;
	int rangeDuration = maxDuration - minDuration;
	int actualDuration = (arc4random() % rangeDuration) + minDuration;
	
	// 액션 - 이동 액션이 끝나면 스프라이트 삭제 액션 동작
	id moveAction = [CCMoveTo actionWithDuration:actualDuration position:ccp(destX, destY)];
	id removeAction = [CCCallFunc actionWithTarget:self selector:@selector(removeEnemy)];
	[self runAction:[CCSequence actions:moveAction, removeAction, nil]];	
}

-(void)explode:(CCAnimation *)explosionAni {
	[self stopAllActions];
	
	id explosionAction = [CCAnimate actionWithAnimation:explosionAni];
	id removeAction = [CCCallFunc actionWithTarget:self selector:@selector(removeEnemy)];
	[self runAction:[CCSequence actions:explosionAction, removeAction, nil]];
	[[SimpleAudioEngine sharedEngine] playEffect:@"explosion.aif"];	
}

@end
