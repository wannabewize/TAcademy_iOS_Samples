//
//  TableCustomCellExerciseViewController.m
//  TableCustomCellExercise
//
//  Created by wannabewize on 3/31/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TableCustomCellExerciseViewController.h"
#import "CustomCell.h"

@implementation TableCustomCellExerciseViewController

#define CELL_ID @"CELL_ID"

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	CustomCell *cell = (CustomCell *)[tableView dequeueReusableCellWithIdentifier:CELL_ID];
	if ( cell == nil ) {
		NSArray *array = [[NSBundle mainBundle] loadNibNamed:@"CustomCell" owner:nil options:nil];
		cell = [array objectAtIndex:0];
	}
	// 셀 데이터 설정
	[cell setCellData:[products objectAtIndex:indexPath.row]];
	return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [products count];
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	return @"상품 목록";
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	return 80;
}

- (void)dealloc {
    [productTable release];
	[products release];
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
	productTable.delegate = self;
	productTable.dataSource = self;
}


- (void)viewDidUnload {
    [productTable release];
    productTable = nil;
    [super viewDidUnload];
}

@end
