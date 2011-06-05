//
//  MessageUIExerciseViewController.h
//  MessageUIExercise
//
//  Created by wannabewize_air on 4/3/11.
//  Copyright 2011 iNEED. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

@interface MessageUIExerciseViewController : UIViewController <MFMessageComposeViewControllerDelegate, MFMailComposeViewControllerDelegate> {
    
}

- (IBAction)sendSMS:(id)sender;
- (IBAction)sendMail:(id)sender;


@end
