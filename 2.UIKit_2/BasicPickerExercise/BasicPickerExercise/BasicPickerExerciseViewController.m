//
//  BasicPickerExerciseViewController.m
//  BasicPickerExercise
//
//  Created by wannabewize_air on 4/12/11.
//  Copyright 2011 iNEED. All rights reserved.
//

#import "BasicPickerExerciseViewController.h"

@implementation BasicPickerExerciseViewController

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
	return 2;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
	if ( 0 == component )
		return [data1 count];
	else
		return [data2 count];
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
	if (0 == component) {
		return [data1 objectAtIndex:row];
	}
	else {
		return [data2 objectAtIndex:row];
	}
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
	NSString *selectStr = nil;
	if ( 0 == component )
		selectStr = [data1 objectAtIndex:row];
	else
		selectStr = [data2 objectAtIndex:row];
	
	label.text = [NSString stringWithFormat:@"선택 %@", selectStr];
}


- (void)dealloc {
    [label release];
	[data1 release];
	[data2 release];
	
    [super dealloc];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - View lifecycle


- (void)viewDidLoad {
    [super viewDidLoad];
	data1 = [[NSArray alloc] initWithObjects:@"a", @"b", @"c", @"d", @"e", nil];
	data2 = [[NSArray alloc] initWithObjects:@"1", @"2", @"3", @"4", @"5", nil];
}

- (void)viewDidUnload {
    [label release];
    label = nil;
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
