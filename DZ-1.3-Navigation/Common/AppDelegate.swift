//
//  AppDelegate.swift
//  DZ-1.3-Navigation
//
//  Created by Denis Zozulya on 03.02.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = TabBarController()
        window?.makeKeyAndVisible()
        UINavigationBar.appearance().backgroundColor = .systemBackground
        //     UINavigationBar.appearance().isHidden = true
        return true
    }
}

