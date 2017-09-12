//
//  AppDelegate.swift
//  BackgroundTask
//
//  Created by ZhiFei on 2017/9/12.
//  Copyright © 2017年 ZhiFei. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?
  var timeValue: Int = 0
  var timer: Timer?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.
    
    timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.hehe), userInfo: nil, repeats: true)
    
    return true
  }
  
  func hehe() {
    timeValue += 1
    print("timevalue == \(timeValue)")
    
    if timeValue%100 == 0 {
      let url = URL(string: "http://www.jianshu.com/p/24f32aa32003")!
      let task = URLSession.shared.dataTask(with: url, completionHandler: {
        (data, response, err) in
        var string = "呵呵哒"
        if let data = data {
          string = String(data: data, encoding: .utf8)!
        }
        debugPrint("data == \(string)")
      })
      task.resume()
    }
    
  }

  func applicationWillResignActive(_ application: UIApplication) {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
  }

  func applicationDidEnterBackground(_ application: UIApplication) {
    ZFBackgroundTask.startBackgroundTask()
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

