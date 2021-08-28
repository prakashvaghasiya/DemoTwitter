//
//  AppDelegate.swift
//  DemoTwitter
//
//  Created by iMac on 26/08/21.
//

import UIKit
import TwitterKit
import SafariServices
@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        TWTRTwitter.sharedInstance().start(withConsumerKey: TWITTER_CONSUMER_KEY, consumerSecret: TWITTER_CONSUMER_SECRTE_KEY)
        let home = StoryBoard("SplashVC") as! SplashVC
        
        let nav = SlideNavigationController.init(rootViewController: home)
        window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = nav
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        return TWTRTwitter.sharedInstance().application(app, open: url, options: options)
    }
}

