//
//  CustomCell.m
//  TableCustomCellExercise
//
//  Created by wannabewize on 3/31/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CustomCell.h"


@implementation CustomCell

-(void)setCellData:(NSDictionary *)data {
	itemImageView.image = [UIImage imageNamed:[data objectForKey:ITEM_PIC]];
	priceLabel.text = [data objectForKey:ITEM_PRICE];
	nameLabel.text = [data objectForKey:ITEM_NAME];
}

- (void)dealloc {
    [itemImageView release];
    [nameLabel release];
    [priceLabel release];
    [super dealloc];
}

@end
