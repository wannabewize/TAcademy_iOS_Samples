//
//  ImageGalleryViewController.h
//  ImageGallery
//
//  Created by wannabewize on 4/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageGalleryViewController : UIViewController {
    IBOutlet UIImageView *imageView;
	IBOutlet UIButton *leftButton;
	IBOutlet UIButton *rightButton;	
	int imageIndex;
}

-(IBAction)changeImage:(id)sender;

@end
