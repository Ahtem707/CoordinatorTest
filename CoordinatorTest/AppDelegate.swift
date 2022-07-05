//
//  AppDelegate.swift
//  Test
//
//  Created by Ahtem Sitjalilov on 24.08.2021.
//

import UIKit

//@main
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var appCoordinator: AppCoordinator?
    
    var rootController: UINavigationController {

        window = UIWindow(frame: UIScreen.main.bounds)
        let theme = UIScreen.main.traitCollection.userInterfaceStyle
        if theme == .dark {
            window?.backgroundColor = .black
        } else {
            window?.backgroundColor = .white
        }
        let nav = UINavigationController()
        window?.rootViewController = nav
        window?.makeKeyAndVisible()
        return nav
    }
 
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        appCoordinator = AppCoordinator(navigationController: rootController)
        appCoordinator?.start()
        
        return true
    }
}
