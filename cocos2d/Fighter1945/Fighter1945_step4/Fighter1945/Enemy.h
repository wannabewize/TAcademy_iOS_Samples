//
//  Enemy.h
//  Fighter1945
//
//  Created by wannabewize_air on 6/14/11.
//  Copyright 2011 iNEED. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@class BattleFieldLayer;

@interface Enemy : CCSprite {
    BattleFieldLayer *battleField;
}

+(id)enemyIn:(BattleFieldLayer *)layer;
-(void)move;
-(void)explode:(CCAnimation *)explosionAni;

@property (assign) BattleFieldLayer *battleField; 
@end
