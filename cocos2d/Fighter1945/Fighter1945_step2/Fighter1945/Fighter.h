//
//  Fighter.h
//  FighterJoysticMoveExercise
//
//  Created by wannabewize on 6/14/11.
//  Copyright 2011 iNEED. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface Fighter : CCSprite {    
    float direction;
	float speed;
}

-(void)move;

+(id)fighter;

@property float direction, speed;

@end
