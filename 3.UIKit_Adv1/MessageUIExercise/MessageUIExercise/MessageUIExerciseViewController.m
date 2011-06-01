//
//  MessageUIExerciseViewController.m
//  MessageUIExercise
//
//  Created by wannabewize_air on 4/3/11.
//  Copyright 2011 iNEED. All rights reserved.
//

#import "MessageUIExerciseViewController.h"

@implementation MessageUIExerciseViewController

#pragma mark MessageUI

-(void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result {
	switch (result) {
		case MessageComposeResultCancelled:
			NSLog(@"Result: SMS sending canceled");
			break;
		case MessageComposeResultSent:
			NSLog(@"Result: SMS sent");
			break;
		case MessageComposeResultFailed:
			NSLog(@"Result: SMS sending failed");
			break;
		default:
			NSLog(@"Wrong Result");
			break;
	}
	[controller dismissModalViewControllerAnimated:YES];
}

- (IBAction)sendSMS:(id)sender {
	if ( [MFMessageComposeViewController canSendText] ) {
		MFMessageComposeViewController *smsVC = [[MFMessageComposeViewController alloc] init];
		smsVC.messageComposeDelegate = self;
		[smsVC setBody:@"SMS Message"];
		[smsVC setRecipients:[NSArray arrayWithObject:@"012-345-6789"]];		 
		[self presentModalViewController:smsVC animated:YES];
		[smsVC release];
	}
}	


-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
	switch (result) {
		case MFMailComposeResultCancelled:
			NSLog(@"Result: canceled");
			break;
		case MFMailComposeResultSaved:
			NSLog(@"Result: saved");
			break;
		case MFMailComposeResultSent:
			NSLog(@"Result: sent");
			break;
		case MFMailComposeResultFailed:
			NSLog(@"Result: failed");
			break;
		default:
			NSLog(@"Wrong Result");
			break;
	}	
	[controller dismissModalViewControllerAnimated:YES];
}

- (IBAction)sendMail:(id)sender {
	if ( [MFMailComposeViewController canSendMail] ) {
		MFMailComposeViewController *mailVC = [[MFMailComposeViewController alloc] init];
		[mailVC setMailComposeDelegate:self];
		
		[mailVC setSubject:@"cute cat picture!"];
		[mailVC setToRecipients:[NSArray arrayWithObject:@"first@example.com"]];
		[mailVC setCcRecipients:[NSArray arrayWithObjects:@"second@example.com", @"third@example.com", nil]];
		
		NSString *attachFilePath = [[NSBundle mainBundle] pathForResource:@"cat" ofType:@"jpg"];
		NSData *attach = [NSData dataWithContentsOfFile:attachFilePath];
		NSLog(@"attach's size : %d", [attach length]);
		[mailVC addAttachmentData:attach mimeType:@"image/jpeg" fileName:@"cat"];
		
		NSString *messageBody = @"This is cute cat picture!";
		[mailVC setMessageBody:messageBody isHTML:NO];
		
		[self presentModalViewController:mailVC animated:YES];
		[mailVC release];
	} else {
		NSLog(@"Can not send Mail");
	}
}



- (void)dealloc {
    [super dealloc];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewDidUnload {
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
