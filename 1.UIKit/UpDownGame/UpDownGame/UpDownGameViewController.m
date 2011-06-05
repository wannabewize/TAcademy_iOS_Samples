//
//  UpDownGameViewController.m
//  UpDownGame
//
//  Created by wannabewize_air on 4/11/11.
//  Copyright 2011 iNEED. All rights reserved.
//

#import "UpDownGameViewController.h"

@implementation UpDownGameViewController

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
	if ( buttonIndex == alertView.firstOtherButtonIndex ) {
		[self newGame];
	}
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
	[self checkInput:nil];
	return YES;
}

- (void)dealloc {
    [label release];
	[userInput release];
	[countLabel release];
	[progress release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
	userInput.delegate = self;
	[self newGame];
}

-(void)viewWillAppear:(BOOL)animated {
	[userInput becomeFirstResponder];
}

- (void)viewDidUnload {
    [label release];
    label = nil;
	[userInput release];
	userInput = nil;
	[countLabel release];
	countLabel = nil;
	[progress release];
	progress = nil;
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (IBAction)newGame {
	int selectedGame = gameSelector.selectedSegmentIndex;
	int maximumRandom = 0;
	if ( 0 == selectedGame) {
		maximunTrial = 5;
		maximumRandom = 10;
	}
	else if ( 1 == selectedGame ) {
		maximunTrial = 10;
		maximumRandom = 50;
	}
	else {
		maximunTrial = 20;
		maximumRandom = 100;
	}
	answer = random() % maximumRandom + 1;
	trial = 0;	
	progress.progress = 0.0;
	countLabel.text = @"";
	label.text = @"";
	
	NSLog(@"New Game with answer : %d", answer);
}

- (IBAction)checkInput:(id)sender {
	int inputVal = [userInput.text intValue];
	userInput.text = @"";
	 
	if ( answer == inputVal ) {
		label.text = @"정답입니다.";
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"정답" message:@"다시 게임하겠습니까?" delegate:self cancelButtonTitle:@"취소" otherButtonTitles:@"확인", nil];
		alert.tag = 11;
		[alert show];
		[alert release];
	} else {		
		trial ++;
		if ( trial >= maximunTrial ) {
			NSString *msg = [NSString stringWithFormat:@"답은 %d입니다.", answer];
			UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"실패" message:msg delegate:self cancelButtonTitle:@"취소" otherButtonTitles:@"확인", nil];
			alert.tag = 12;
			[alert show];
			[alert release];
		} else {
			if ( answer > inputVal ) {
				label.text = @"Down";
			} else {
				label.text = @"Up";
			}
			countLabel.text = [NSString stringWithFormat:@"%d / %d", trial, maximunTrial];			
			progress.progress = trial / (float)maximunTrial;
		}
	}
}

@end
