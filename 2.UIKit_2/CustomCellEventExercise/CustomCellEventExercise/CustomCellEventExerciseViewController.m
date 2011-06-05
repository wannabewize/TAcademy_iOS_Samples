//
//  CustomCellEventExerciseViewController.m
//  CustomCellEventExercise
//
//  Created by wannabewize_air on 4/13/11.
//  Copyright 2011 iNEED. All rights reserved.
//

#import "CustomCellEventExerciseViewController.h"
#import "CustomCell.h"

@implementation CustomCellEventExerciseViewController

-(void)addItemToCart:(NSString *)itemId {
	NSLog(@"Adding Item to Cart : %@", itemId);
	
	NSMutableDictionary *cartItem = [cartMap objectForKey:itemId];
	if ( nil == cartItem ) {
		for (NSDictionary *product in products) {
			if ( [[product objectForKey:ITEM_ID] isEqualToString:itemId] ) {
				NSMutableDictionary *newCartItem = [NSMutableDictionary dictionaryWithObjectsAndKeys:
													itemId, ITEM_ID,
													[product objectForKey:ITEM_NAME], ITEM_NAME,
													[product objectForKey:ITEM_PRICE], ITEM_PRICE,
													[NSNumber numberWithInt:1], ITEM_QTY,													
													nil];
				[cartMap setObject:newCartItem forKey:itemId];
				[cart addObject:newCartItem];
			}
		}		
	} else {
		[self increaseCartItemQty:itemId];
	}
	
	[productTable reloadData];
}

-(void)increaseItem:(NSString *)itemId {
	NSMutableDictionary *cartItem = [cartMap objectForKey:itemId];
	NSNumber *qtyNum = [cartItem objectForKey:ITEM_QTY];
	int newQty = [qtyNum intValue] + 1;
	[cartItem setObject:[NSNumber numberWithInt:newQty] forKey:ITEM_QTY];	
	
	[productTable reloadData];	
}

-(void)decreaseItem:(NSString *)itemId {
	NSMutableDictionary *cartItem = [cartMap objectForKey:itemId];
	NSNumber *qtyNum = [cartItem objectForKey:ITEM_QTY];
	int newQty = [qtyNum intValue] - 1;
	
	if ( newQty == 0 ) {
		[cartMap removeObjectForKey:itemId];
		[cart removeObject:cartItem];
	}
	else {
		[cartItem setObject:[NSNumber numberWithInt:newQty] forKey:ITEM_QTY];
	}
	
	[productTable reloadData];
}



#define CART_CELL_ID @"CART_CELL_ID"
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	if ( indexPath.section == 0 ) {
		CustomCell *cell = (CustomCell *)[tableView dequeueReusableCellWithIdentifier:PRODUCT_CELL_ID];
		if ( cell == nil ) {
			NSArray *array = [[NSBundle mainBundle] loadNibNamed:@"CustomCell" owner:nil options:nil];
			cell = [array objectAtIndex:0];
			cell.delegate = self;
		}
		[cell setCellData:[products objectAtIndex:indexPath.row]];
		return cell;
	} else {
		CartItemCell *cell = (CartItemCell *)[tableView dequeueReusableCellWithIdentifier:CART_CELL_ID];
		if ( nil == cell ) {
			NSArray *array = [[NSBundle mainBundle] loadNibNamed:@"CustomCell" owner:nil options:nil];
			cell = [array objectAtIndex:1];
			cell.delegate = self;
		}
		[cell setCartItemData:[cart objectAtIndex:indexPath.row]];
		return cell;
	}
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	if ( 0 == section)
		return [products count];
	else
		return [cart count];
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	if ( 0 == section )
		return @"상품목록";
	else
		return @"카드";
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	if ( 0 == indexPath.section ) 
		return 80;
	else
		return 44;
}

- (void)dealloc {
	[products release];
	[productTable release];
	[cart release];
	[cartMap release];
	
    [super dealloc];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - View lifecycle


- (void)viewDidLoad {
    [super viewDidLoad];
	products = [[NSArray alloc] initWithObjects:
			[NSDictionary dictionaryWithObjectsAndKeys:@"0", ITEM_ID, @"iPAD", ITEM_NAME, @"699$", ITEM_PRICE, @"ipad2.jpg", ITEM_PIC,nil],
			[NSDictionary dictionaryWithObjectsAndKeys:@"1", ITEM_ID, @"iMAC", ITEM_NAME, @"1199$", ITEM_PRICE, @"imac.jpg", ITEM_PIC,nil],
			[NSDictionary dictionaryWithObjectsAndKeys:@"2", ITEM_ID, @"iPhone", ITEM_NAME, @"699$", ITEM_PRICE, @"iphone.jpg", ITEM_PIC,nil],
			[NSDictionary dictionaryWithObjectsAndKeys:@"3", ITEM_ID, @"MacBook", ITEM_NAME, @"999$", ITEM_PRICE, @"macbook.jpg", ITEM_PIC,nil],
			[NSDictionary dictionaryWithObjectsAndKeys:@"4", ITEM_ID, @"iPad Nano", ITEM_NAME, @"149$", ITEM_PRICE, @"nano.jpg", ITEM_PIC,nil],
			nil];
	
	cart = [[NSMutableArray alloc] init];
	productTable.delegate = self;
	productTable.dataSource = self;
	
	cartMap = [[NSMutableDictionary alloc] init];
	
}

- (void)viewDidUnload {
	[productTable release];
	productTable = nil;
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
