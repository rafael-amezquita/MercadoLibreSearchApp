//
//  AppDelegate.swift
//  MercadoLibreSearchApp
//
//  Created by Rafael Amezquita on 18/06/20.
//  Copyright © 2020 Rafael Amezquita. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var coordinator: Coordinator?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        coordinatorConfiguration()
        return true
    }

    // MARK: - Restoration
    
    func application(_ application: UIApplication, shouldSaveApplicationState coder: NSCoder) -> Bool {
        return true
    }
    
    func application(_ application: UIApplication, shouldRestoreApplicationState coder: NSCoder) -> Bool {
        return true
    }
    
    @available(iOS 13.2, *)
    func application(_ application: UIApplication, shouldSaveSecureApplicationState coder: NSCoder) -> Bool {
        return true
    }
    
    @available(iOS 13.2, *)
    func application(_ application: UIApplication, shouldRestoreSecureApplicationState coder: NSCoder) -> Bool {
        coordinatorConfiguration()
        return true
    }
    
    // MARK: - Utilities
    
    func coordinatorConfiguration() {
        guard let navigationController = window?.rootViewController as? UINavigationController,
            let searchTableViewController = navigationController.topViewController as? SearchTableViewController  else {
                return
        }
            
        coordinator = Coordinator(with: searchTableViewController)
    }

}

