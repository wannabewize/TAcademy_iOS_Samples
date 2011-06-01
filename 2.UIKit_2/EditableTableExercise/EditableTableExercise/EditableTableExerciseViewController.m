//
//  EditableTableExerciseViewController.m
//  EditableTableExercise
//
//  Created by wannabewize_air on 4/8/11.
//  Copyright 2011 iNEED. All rights reserved.
//

#import "EditableTableExerciseViewController.h"

@implementation EditableTableExerciseViewController

#pragma mark UITableViewDelegate, DataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [data count];
}
#define CELL_ID @"CELL_ID"
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL_ID];
	if ( nil == cell ) {
		cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CELL_ID] autorelease];
	}
	cell.textLabel.text = [data objectAtIndex:indexPath.row];
	return cell;
}

// 셀 수정
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
	if ( editingStyle == UITableViewCellEditingStyleDelete ) {
		[data removeObjectAtIndex:indexPath.row];
		[table reloadData];
	}
}

// 셀 이동
-(BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}

// 셀 이동 -> 데이터 적용
-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
	NSObject *obj = [[data objectAtIndex:sourceIndexPath.row] retain];
	[data removeObjectAtIndex:sourceIndexPath.row];
	[data insertObject:obj atIndex:destinationIndexPath.row];
	[obj release];
	
	NSLog(@"data : %@", data);
}


// 키보드
-(BOOL)textFieldShouldReturn:(UITextField *)textField {
	[textField resignFirstResponder];
	[self addItem:nil];
	return YES;
}


- (void)dealloc {
	[data release];
    [table release];
    [contextTextField release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)loadData {
	NSArray *arr = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *path = [[arr objectAtIndex:0] stringByAppendingPathComponent:@"data.plist"];
	data = [[NSMutableArray alloc] initWithContentsOfFile:path];
}


- (void)viewDidLoad {
    [super viewDidLoad];
		
	contextTextField.delegate = self;
	table.delegate = self;
	table.dataSource = self;	
	
	[self loadData];
	if ( nil == data )
		data = [[NSMutableArray alloc] init];
}

- (void)viewDidUnload {
    [table release];
    table = nil;
    [contextTextField release];
    contextTextField = nil;
	
    [super viewDidUnload];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(void)saveData {
	NSArray *arr = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *path = [[arr objectAtIndex:0] stringByAppendingPathComponent:@"data.plist"];
	[data writeToFile:path atomically:YES];
}


// 데이터 추가
- (IBAction)addItem:(id)sender {
	NSString *inputStr = contextTextField.text;
	if ( [inputStr length] > 0 ) {
		[data addObject:inputStr];
		[table reloadData];
		contextTextField.text = @"";
	}
}

// 편집/완료 상태 토글식 동작
- (IBAction)toggleEditMode:(id)sender {
	table.editing = !table.editing;
	((UIBarButtonItem *)sender).title = table.editing ? @"Done" : @"Edit";	
}

@end
