//
//  ViewController.swift
//  DemoTwitter
//
//  Created by iMac on 26/08/21.
//

import UIKit
import TwitterKit
import Alamofire
class HomeVC: UIViewController {
        
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
    }
    
    //MARK: Methods
    private func setupData() {
        setupLogin()
        setupNavigationBar()
    }
    
    private func setupLogin() {
        let logInButton = TWTRLogInButton(logInCompletion: { session, error in
            if let session = session {
                let client = TWTRAPIClient.withCurrentUser()
                client.requestEmail { email, error in
                    if (email != nil) {
                        let vc = StoryBoard("UserProfileVC") as! UserProfileVC
                        UserDefaults.isLogin = true
                        UserDefaults.userEmail = email ?? ""
                        UserDefaults.userName = session.userName
                        UserDefaults.userid = session.userID
                        self.navigationController?.pushViewController(vc, animated: true)
                    } else {
                        self.view.makeToast("error--: \(String(describing: error?.localizedDescription))")
                    }
                }
            } else {
                let errorDescription = error?.localizedDescription ?? "unknown"
                self.view.makeToast("error: \(errorDescription)")
            }
        })
        logInButton.center = self.view.center
        self.view.addSubview(logInButton)
    }
    
    private func setupNavigationBar() {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
}

