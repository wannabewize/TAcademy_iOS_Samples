//
//  TabAndNaviExerciseAppDelegate.m
//  TabAndNaviExercise
//
//  Created by wannabewize_air on 4/3/11.
//  Copyright 2011 iNEED. All rights reserved.
//

#import "TabAndNaviExerciseAppDelegate.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"


@implementation TabAndNaviExerciseAppDelegate


@synthesize window=_window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	FirstViewController *first = [[FirstViewController alloc] initWithNibName:@"FirstViewController" bundle:nil];	
	SecondViewController *second = [[SecondViewController alloc] initWithNibName:@"SecondViewController" bundle:nil];	
	ThirdViewController *third = [[ThirdViewController alloc] initWithNibName:@"ThirdViewController" bundle:nil];	
	
	UINavigationController *navi1 = [[UINavigationController alloc] initWithRootViewController:first];
	UINavigationController *navi2 = [[UINavigationController alloc] initWithRootViewController:second];
	UINavigationController *navi3 = [[UINavigationController alloc] initWithRootViewController:third];	
	
	NSArray *controllers = [NSArray arrayWithObjects:navi1, navi2, navi3, nil];
	UITabBarController *tabBarController = [[UITabBarController alloc] init];
	[tabBarController setViewControllers:controllers animated:YES];
	
	[first release];
	[second release];
	[third release];
	
	[navi1 release];
	[navi2 release];
	[navi3 release];
	
	self.window.rootViewController = tabBarController;
	[self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
	/*
	 Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
	 Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
	 */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
	/*
	 Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
	 If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
	 */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
	/*
	 Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
	 */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
	/*
	 Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
	 */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
	/*
	 Called when the application is about to terminate.
	 Save data if appropriate.
	 See also applicationDidEnterBackground:.
	 */
}

- (void)dealloc
{
	[_window release];
    [super dealloc];
}

@end
