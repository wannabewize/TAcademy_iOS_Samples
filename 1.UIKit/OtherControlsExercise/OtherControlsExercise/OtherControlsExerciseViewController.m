//
//  OtherControlsExerciseViewController.m
//  OtherControlsExercise
//
//  Created by wannabewize on 3/23/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "OtherControlsExerciseViewController.h"

@implementation OtherControlsExerciseViewController


-(BOOL)textFieldShouldReturn:(UITextField *)textField {
	label.text = textField.text;
	[textField resignFirstResponder];
}


- (void)dealloc {
    [colorView release];
	[redSlider release];
	[greenSlider release];
	[blueSlider release];
	[label release];
	[userInputField release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)dismissKeyboard {
	[userInputField resignFirstResponder];	
	[[self.view viewWithTag:88] removeFromSuperview];
}

-(void)addHiddenButtonForKeyboard {
	UIButton *button = [[UIButton alloc] initWithFrame:self.view.frame];
	button.tag = 88;
	[self.view addSubview:button];
	[button addTarget:self action:@selector(dismissKeyboard) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark - View lifecycle

-(void)changeKeyboardType:(id)sender {
	UISegmentedControl *typeChooser = (UISegmentedControl *)sender;
	userInputField.keyboardType = typeChooser.selectedSegmentIndex;
}



- (void)viewDidLoad {
    [super viewDidLoad];
	activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
	activityIndicator.center = self.view.center;
	[self.view addSubview:activityIndicator];
	[activityIndicator stopAnimating];
	
	[self onColorSliderChanged:nil];
	
	[redSlider setThumbImage:[UIImage imageNamed:@"star_red.png"] forState:UIControlStateNormal];
	
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(addHiddenButtonForKeyboard) name:UIKeyboardDidShowNotification object:nil];	
}


- (void)viewDidUnload
{
    [colorView release];
    colorView = nil;
	[redSlider release];
	redSlider = nil;
	[greenSlider release];
	greenSlider = nil;
	[blueSlider release];
	blueSlider = nil;
	[label release];
	label = nil;
	
	[[NSNotificationCenter defaultCenter] removeObject:self];
	
	[userInputField release];
	userInputField = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)onColorSliderChanged:(id)sender {
	if ( [activityIndicator isAnimating] )
		[activityIndicator stopAnimating];
	colorView.backgroundColor = [UIColor colorWithRed:redSlider.value green:greenSlider.value blue:blueSlider.value alpha:1.0];
}

- (IBAction)powerOnOff:(id)sender {
	BOOL isOn = ((UISwitch *)sender).on;
	
	redSlider.enabled = isOn;
	greenSlider.enabled = isOn;
	blueSlider.enabled = isOn;
	userInputField.enabled = isOn;	
	
	if ( isOn ) {
		[activityIndicator startAnimating];		
		[self performSelector:@selector(onColorSliderChanged:) withObject:nil afterDelay:1.0];
	}
	else {
		colorView.backgroundColor = [UIColor grayColor];
	}

}
@end
