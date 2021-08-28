//
//  SplashVC.swift
//  DemoTwitter
//
//  Created by iMac on 27/08/21.
//

import UIKit

class SplashVC: UIViewController {

    //MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        delay(interval: 0.5) {
            if UserDefaults.isLogin {
                let vc = StoryBoard("UserProfileVC") as! UserProfileVC
                SlideNavigationController.sharedInstance()?.popAllAndSwitch(to: vc, withCompletion: nil)
            } else {
                let vc = StoryBoard("HomeVC") as! HomeVC
                SlideNavigationController.sharedInstance()?.popAllAndSwitch(to: vc, withCompletion: nil)
            }
        }
    }

    //MARK:- Methods
    private func setupNavigationBar() {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
}
