//
//  AppDelegate.swift
//  WeChat
//
//  Created by chen on 2016/11/3.
//  Copyright © 2016年 JD. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow.init(frame: UIScreen.main.bounds)
        window?.backgroundColor = UIColor.white
        window?.rootViewController = WCTabBarController()
        window?.makeKeyAndVisible()
        
        return true
    }

}

