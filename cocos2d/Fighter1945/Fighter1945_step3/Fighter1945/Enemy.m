//
//  Enemy.m
//  Fighter1945
//
//  Created by wannabewize_air on 6/14/11.
//  Copyright 2011 iNEED. All rights reserved.
//

#import "Enemy.h"


@implementation Enemy

+(id)enemy {
	Enemy *enemy = [super spriteWithFile:@"enemy.png"];
	return enemy;
}

@end
