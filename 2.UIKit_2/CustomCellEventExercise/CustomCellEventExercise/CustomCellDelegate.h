//
//  CustomCellDelegate.h
//  TableCustomCellExercise
//
//  Created by wannabewize on 3/31/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol CustomCellDelegate

-(void)addItemToCart:(NSString *)itemId;

@end



@protocol CartItemCellDelegate

-(void)increaseItem:(NSString *)itemId;
-(void)decreaseItem:(NSString *)itemId;

@end