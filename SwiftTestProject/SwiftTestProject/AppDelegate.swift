//
//  AppDelegate.swift
//  SwiftTestProject
//
//  Created by 李秉達 on 2019/12/5.
//  Copyright © 2019 李秉達. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        window!.backgroundColor = UIColor.white
        window!.makeKeyAndVisible()
        
        let vc = MainVC()
        window?.rootViewController = vc
        return true
    }
    
    
}

