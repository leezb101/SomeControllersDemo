//
//  AppDelegate.swift
//  SomeControllersDemo
//
//  Created by leezb101 on 2018/4/21.
//  Copyright © 2018年 leezb. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let tabbarController = UITabBarController()
        let firstVC = ViewController()
        firstVC.view.backgroundColor = .red
        firstVC.title = "first"
        
        let secondVC = SecondViewController()
        secondVC.title = "second"
        
        let firstNavi = UINavigationController(rootViewController: firstVC)
        let secondNavi = UINavigationController(rootViewController: secondVC)
        tabbarController.viewControllers = [firstNavi, secondNavi]
        tabbarController.selectedIndex = 0
        
        let launchVC: LaunchViewController = LaunchViewController()
        launchVC.transitioningDelegate = self
        launchVC.delayBlock = {[weak launchVC] in
            guard launchVC != nil else { return }
            launchVC!.dismiss(animated: true, completion: {
                print("。。。")
                tabbarController.transitioningDelegate = nil
            })
        }
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = tabbarController
        window.makeKeyAndVisible()
        self.window = window
        
        tabbarController.present(launchVC, animated: false, completion: nil)
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

}

extension AppDelegate: UIViewControllerTransitioningDelegate {
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if dismissed.isKind(of: LaunchViewController.self) {
            return LaunchTransitionAnimation()
        }
        return nil
    }
}
