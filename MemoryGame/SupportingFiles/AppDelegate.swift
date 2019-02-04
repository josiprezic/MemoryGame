//
//  AppDelegate.swift
//  Test2App
//
//  Created by Josip Rezic on 23/04/2018.
//  Copyright © 2018 Josip Rezic. All rights reserved.
//

import UIKit
import RevealingSplashView

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let navigationController = UINavigationController.init(rootViewController: MenuViewController.fromStoryboard())
        self.window?.rootViewController = navigationController
        
        UINavigationBar.appearance().barTintColor = UIHelper.AppColors.GRAY_LIGHT
        UINavigationBar.appearance().tintColor = UIColor.white
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.foregroundColor:UIColor.white]

        self.window?.makeKeyAndVisible()
        showSplashView()

        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) { }

    func applicationDidEnterBackground(_ application: UIApplication) { }

    func applicationWillEnterForeground(_ application: UIApplication) { }

    func applicationDidBecomeActive(_ application: UIApplication) { }

    func applicationWillTerminate(_ application: UIApplication) { }
    
    //
    // MARK: - CUSTOM METHODS
    //
    
    func showSplashView(delay: TimeInterval = 1.2) {
        let splashIconColor = UIColor.black
        let splashBackgroundColor = UIHelper.AppColors.GRAY_LIGHT
        let splashImage = #imageLiteral(resourceName: "lightBulb")
        let splashInitialSize = CGSize(width: 100, height: 100)
        let splashView = RevealingSplashView(iconImage: splashImage, iconInitialSize: splashInitialSize, backgroundColor: splashBackgroundColor)
        splashView.useCustomIconColor = false
        splashView.iconColor = splashIconColor
        splashView.delay = delay
        
        self.window?.addSubview(splashView)
        splashView.startAnimation() {}
    }
}

