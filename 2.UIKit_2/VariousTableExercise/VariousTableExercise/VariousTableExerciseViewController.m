//
//  VariousTableExerciseViewController.m
//  VariousTableExercise
//
//  Created by wannabewize_air on 6/1/11.
//  Copyright 2011 iNEED. All rights reserved.
//

#import "VariousTableExerciseViewController.h"

#define DATA_NUM 4;
#define CELL_ID1 @"CELL_ID1"
#define CELL_ID2 @"CELL_ID2"
#define CELL_ID3 @"CELL_ID3"
#define CELL_ID4 @"CELL_ID4"

@implementation VariousTableExerciseViewController

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return DATA_NUM;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	switch (section) {
		case 0:
			return [data1 count];
		case 1:
			return [data2 count];
		case 2:
			return [data3 count];
		default:
			return [data4 count];
	}
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	return [sectionHeaders objectAtIndex:section];
}

// 섹션 별로, 셀 재사용 ID구분, 셀 생성 스타일
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	if ( 0 == indexPath.section ) {
		UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL_ID1];
		if ( nil == cell )
			cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CELL_ID1] autorelease];
		cell.textLabel.text = [data1 objectAtIndex:indexPath.row];
		return cell;
	}
	else if ( 1 == indexPath.section) {
		UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL_ID2];
		if ( nil == cell )
			cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CELL_ID2] autorelease];
		cell.textLabel.text = [data2 objectAtIndex:indexPath.row];
		cell.detailTextLabel.text = [NSString stringWithFormat:@"Section : %d Row : %d", indexPath.section, indexPath.row];
		return cell;
	}
	else if ( 2 == indexPath.section) {
		UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL_ID3];
		if ( nil == cell )
			cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CELL_ID3] autorelease];
		cell.textLabel.text = [data3 objectAtIndex:indexPath.row];
		cell.detailTextLabel.text = [NSString stringWithFormat:@"Section : %d Row : %d", indexPath.section, indexPath.row];
		return cell;
	}
	else {
		UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL_ID4];
		if ( nil == cell )
			cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CELL_ID4] autorelease];
		cell.textLabel.text = [data4 objectAtIndex:indexPath.row];
		cell.detailTextLabel.text = [NSString stringWithFormat:@"Section : %d Row : %d", indexPath.section, indexPath.row];
		return cell;
	}
}

// 셀 선택시
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	NSLog(@"Selected Cell's Section : %d, Row : %d", indexPath.section, indexPath.row);
}


- (void)dealloc {
	[data1 release];
	data1 = nil;
	[data2 release];
	data2 = nil;
	[data3 release];
	data3 = nil;
	[data4 release];
	data4 = nil;
    [super dealloc];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - View lifecycle

// 데이터 준비
- (void)viewDidLoad {
    [super viewDidLoad];
	data1 = [[NSArray alloc] initWithObjects:@"a", @"b", @"c", @"d", @"e", nil];
	data2 = [[NSArray alloc] initWithObjects:@"1", @"2", @"3", @"4", @"5", nil];
	data3 = [[NSArray alloc] initWithObjects:@"!", @"@", @"#", @"$", @"%", nil];
	data4 = [[NSArray alloc] initWithObjects:@"가", @"나", @"다", @"라", @"마", nil];
	sectionHeaders = [[NSArray alloc] initWithObjects:@"Alphabets", @"Numbers", @"Special character", @"Korean", nil];
}

- (void)viewDidUnload {
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
