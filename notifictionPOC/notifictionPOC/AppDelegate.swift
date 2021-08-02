//
//  AppDelegate.swift
//  notifictionPOC
//
//  Created by daffolapmac-179 on 10/07/21.
//  Copyright © 2021 daffolapmac-179. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

//    func applicationWillEnterForeground(application: UIApplication!) {
//        let viewController = self.window!.rootViewController;
//        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//
//        var setViewController = mainStoryboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
//        setViewController.execute = true;
//
//
//    }

}

