//
//  AppDelegate.swift
//  InterAppCommunication
//
//  Created by Jaehoon Lee on 2016. 9. 30..
//  Copyright © 2016년 Jaehoon Lee. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

   var window: UIWindow?
   
   func application(application: UIApplication, handleOpenURL url: NSURL) -> Bool {
      print("app : ", application, " url : ", url)
      return true
   }
   // application:openURL:options:
   func application(app: UIApplication, openURL url: NSURL, options: [String : AnyObject]) -> Bool {
      print("open URL : ", url)
      let components = NSURLComponents(URL: url, resolvingAgainstBaseURL: false)!
      if let queryItems = components.queryItems {
         let vc = window!.rootViewController as! ViewController
         for item in queryItems {
            if item.name == "value1" {
               vc.value1 = item.value
            }
            else if item.name == "value2" {
               vc.value2 = item.value
            }
         }
      }
      
      return true
   }

   func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
      // Override point for customization after application launch.
      return true
   }

   func applicationWillResignActive(application: UIApplication) {
      // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
      // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
   }

   func applicationDidEnterBackground(application: UIApplication) {
      // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
      // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
   }

   func applicationWillEnterForeground(application: UIApplication) {
      // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
   }

   func applicationDidBecomeActive(application: UIApplication) {
      // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
   }

   func applicationWillTerminate(application: UIApplication) {
      // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
   }


}

