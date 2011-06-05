//
//  CustomCell.h
//  TableCustomCellExercise
//
//  Created by wannabewize on 3/31/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomCellDelegate.h"

#define ITEM_NAME @"ITEM_NAME"
#define ITEM_PRICE @"ITEM_PRICE"
#define ITEM_PIC @"ITEM_PIC"
#define ITEM_ID @"ITEM_ID"
#define ITEM_QTY @"ITEM_QTY"

#define PRODUCT_CELL_ID @"PRODUCT_CELL_ID"
#define CART_CELL_ID @"CART_CELL_ID"

@interface CustomCell : UITableViewCell {
	id<CustomCellDelegate> delegate;
	IBOutlet UIImageView *itemImageView;
	IBOutlet UILabel *nameLabel;
	IBOutlet UILabel *priceLabel;
	NSString *productId;
}

-(void)setCellData:(NSDictionary *)data;
- (IBAction)addCart:(id)sender;

@property (assign) id<CustomCellDelegate> delegate;

@end



@interface CartItemCell : UITableViewCell {
	id<CartItemCellDelegate> delegate;
	IBOutlet UILabel *nameLabel;
	IBOutlet UILabel *qtyLabel;
	IBOutlet UILabel *priceLabel;
	NSString *productId;
}

-(IBAction)increaseQty;
-(IBAction)decreaseQty;
-(void)setCartItemData:(NSDictionary *)data;

@property (assign) id<CartItemCellDelegate> delegate;

@end
