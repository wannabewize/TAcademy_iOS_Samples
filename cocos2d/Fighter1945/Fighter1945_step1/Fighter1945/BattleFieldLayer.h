//
//  HelloWorldLayer.h
//  FighterJoysticMoveExercise
//
//  Created by wannabewize on 6/14/11.
//  Copyright iNEED 2011. All rights reserved.
//


// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"

@class Fighter;

@interface BattleFieldLayer : CCLayerColor {
	CCSprite *joypad, *joybtn;
	BOOL isMovingJoybtn;

	Fighter *fighter;	
}

+(CCScene *) scene;

@end
