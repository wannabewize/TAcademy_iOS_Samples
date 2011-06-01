//
//  CustomCell.m
//  TableCustomCellExercise
//
//  Created by wannabewize on 3/31/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CustomCell.h"


@implementation CustomCell

@synthesize delegate;

-(void)setCellData:(NSDictionary *)data {
	itemImageView.image = [UIImage imageNamed:[data objectForKey:ITEM_PIC]];
	priceLabel.text = [data objectForKey:ITEM_PRICE];
	nameLabel.text = [data objectForKey:ITEM_NAME];
	productId = [data objectForKey:ITEM_ID];
}

- (IBAction)addCart:(id)sender {
	[delegate addItemToCart:productId];
}

- (void)dealloc {
    [itemImageView release];
    [nameLabel release];
    [priceLabel release];
    [super dealloc];
}

-(NSString *)reuseIdentifier {
	return PRODUCT_CELL_ID;
}

@end


@implementation CartItemCell

@synthesize delegate;

-(void)setCartItemData:(NSDictionary *)data {
	priceLabel.text = [data objectForKey:ITEM_PRICE];
	nameLabel.text = [data objectForKey:ITEM_NAME];
	NSNumber *qty = [data objectForKey:ITEM_QTY];
	qtyLabel.text = [NSString stringWithFormat:@"%@", qty];
	productId = [data objectForKey:ITEM_ID];
}


-(IBAction)increaseQty {
	[delegate increaseItem:productId];
}

-(IBAction)decreaseQty {
	[delegate decreaseItem:productId];	
}

-(NSString *)reuseIdentifier {
	return CART_CELL_ID;
}

-(void)dealloc {
	[priceLabel release];
	[nameLabel release];
	[qtyLabel release];
	[super dealloc];
}

@end
