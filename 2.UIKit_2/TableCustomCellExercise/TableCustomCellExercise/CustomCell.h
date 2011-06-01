//
//  CustomCell.h
//  TableCustomCellExercise
//
//  Created by wannabewize on 3/31/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#define ITEM_NAME @"ITEM_NAME"
#define ITEM_PRICE @"ITEM_PRICE"
#define ITEM_PIC @"ITEM_PIC"
#define ITEM_ID @"ITEM_ID"

@interface CustomCell : UITableViewCell {
	IBOutlet UIImageView *itemImageView;
	IBOutlet UILabel *nameLabel;
	IBOutlet UILabel *priceLabel;
}

-(void)setCellData:(NSDictionary *)data;

@end
