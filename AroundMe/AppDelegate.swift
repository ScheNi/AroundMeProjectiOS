//
//  AppDelegate.swift
//  AroundMe
//
//  Created by Nicolas Schelkens on 19/12/15.
//  Copyright © 2015 Nicolas Schelkens. All rights reserved.
//

import UIKit
import ReachabilitySwift
import SwiftSpinner

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    var reachability:Reachability!;

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        do {
            reachability = try Reachability.reachabilityForInternetConnection()
        } catch {
            print("Unable to create Reachability")
            return false
        }
        NSNotificationCenter.defaultCenter().addObserver(self,
            selector: "reachabilityChanged:",
            name: ReachabilityChangedNotification,
            object: nil)
        
        try! self.reachability.startNotifier()
        
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
    
    // https://github.com/ashleymills/Reachability.swift
    func reachabilityChanged(note: NSNotification) {
        
        let reachability = note.object as! Reachability
        
        // based on http://stackoverflow.com/a/31590016/2523667
        if reachability.isReachable() {
           print("reachable")
            dispatch_async(dispatch_get_main_queue(), {
 
                self.window?.rootViewController?.dismissViewControllerAnimated(true, completion: nil)
            })
            
        } else {
            print("Not reachable")
            SwiftSpinner.hide()
            dispatch_async(dispatch_get_main_queue(), {
                let alert = UIAlertController(title: "No active internet connection!", message: "There doesn't seem to be an active internet connection, please connect to the internet", preferredStyle: UIAlertControllerStyle.Alert)
                self.window?.rootViewController?.presentViewController(alert, animated: true, completion: nil)
            })

        }
    }

}

