//
//  Constant.swift
//  mycarwashing
//
//  Created by Prakash Vaghasiya on 16/02/21.
//  Copyright © 2021 Prakash. All rights reserved.
//

import UIKit


#if TARGET_IPHONE_SIMULATOR
let IsSimulator = true
let IsRealDevice = false
#else
let IsSimulator = false
let IsRealDevice = true
#endif

let SCREEN_WIDTH = UIScreen.main.bounds.size.width
let SCREEN_HEIGHT = UIScreen.main.bounds.size.height
let TWITTER_CONSUMER_KEY = "Sh4JYw4aQ773emLJTL9zlFFF2"
let TWITTER_CONSUMER_SECRTE_KEY = "KYZk6x2O0HO8e1ClUyqDDMjXOnYJhjwHBXrY4PJ6M7OFBxkE7z"

let appWindow: UIWindow? = {
    if #available(iOS 13.0, *) {
        return UIApplication.shared.connectedScenes
            .filter({$0.activationState == .foregroundActive})
            .map({$0 as? UIWindowScene})
            .compactMap({$0})
            .first?.windows
            .filter({$0.isKeyWindow}).first
    }
    
    return UIApplication.shared.delegate?.window ?? nil
}()

extension UserDefaults{
    
    
    static var isLogin: Bool {
        get {
            return (UserDefaults.standard.bool(forKey: "isLogin"))
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "isLogin")
            UserDefaults.standard.synchronize()
        }
    }
    
    static var userid: String {
        get {
            return (UserDefaults.standard.string(forKey: "userid") ?? "")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "userid")
            UserDefaults.standard.synchronize()
        }
    }
    
    static var userName: String {
        get {
            return (UserDefaults.standard.string(forKey: "userName") ?? "")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "userName")
            UserDefaults.standard.synchronize()
        }
    }
    
    static var userEmail: String {
        get {
            return (UserDefaults.standard.string(forKey: "userEmail") ?? "")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "userEmail")
            UserDefaults.standard.synchronize()
        }
    }
    
}
