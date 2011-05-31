//
//  ImageGalleryAppDelegate.h
//  ImageGallery
//
//  Created by wannabewize on 4/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ImageGalleryViewController;

@interface ImageGalleryAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet ImageGalleryViewController *viewController;

@end
