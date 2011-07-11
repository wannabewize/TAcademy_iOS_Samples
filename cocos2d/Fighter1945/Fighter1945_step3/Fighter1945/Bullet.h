//
//  Bullet.h
//  Fighter1945
//
//  Created by wannabewize_air on 6/14/11.
//  Copyright 2011 iNEED. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface Bullet : CCSprite {
    float direction;
	float speed;
}

-(void)move;

@property float direction, speed;

+(id)bullet;

@end
