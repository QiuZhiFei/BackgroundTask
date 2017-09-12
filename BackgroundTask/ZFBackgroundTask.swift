//
//  ZFBackgroundTask.swift
//  DoubanRadio
//
//  Created by ZhiFei on 2017/9/12.
//  Copyright © 2017年 ZhiFei. All rights reserved.
//

import Foundation
import UIKit

private var globalBGTaskID = UIBackgroundTaskInvalid

class ZFBackgroundTask: NSObject {
  
  static func startBackgroundTask() {
    globalBGTaskID = UIBackgroundTaskInvalid
    endBackgroundTask(id: globalBGTaskID)
    
    globalBGTaskID = UIApplication.shared.beginBackgroundTask(expirationHandler: { 
//      UIApplication.shared.endBackgroundTask(globalBGTaskID)
//      globalBGTaskID = UIBackgroundTaskInvalid
    })
  }
  
  static func endBackgroundTask() {
    endBackgroundTask(id: globalBGTaskID)
    globalBGTaskID = UIBackgroundTaskInvalid
  }
  
  static func endBackgroundTask(id: UIBackgroundTaskIdentifier) {
    if id != UIBackgroundTaskInvalid {
      UIApplication.shared.endBackgroundTask(id)
    }
  }
  
}
