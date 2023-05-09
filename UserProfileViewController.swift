//
//  UserProfileViewController.swift
//  DemoTwitter
//
//  Created by iMac on 27/08/21.
//

import UIKit
import SwiftyJSON
import TwitterKit
import SDWebImage
class UserProfileVC: UIViewController {
    
    //MARK: IBOutlet
    @IBOutlet weak var imgUserBanner: UIImageView!
    @IBOutlet weak var imgUserProfile: UIImageView!
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var lblUserId: UILabel!
    @IBOutlet weak var lblUserEmail: UILabel!
    @IBOutlet weak var lblUserDescription: UILabel!
    @IBOutlet weak var lblUserFollowingCount: UILabel!
    @IBOutlet weak var lblUserFollowersCount: UILabel!
    @IBOutlet weak var btnFollowing: UIButton!
    @IBOutlet weak var btnFollowers: UIButton!
    
    //MARK: Varibles
    var userDetailModelObjc: UserDetailModel?
    var accessToken = ""
    
    //MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.getAccessToken()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigation()
    }
    
    //MARK: Methods
    private func setupNavigation() {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    private func setupUserDetail() {
        DispatchQueue.main.async {
            self.lblUserEmail.text = UserDefaults.userEmail
            self.lblUserId.text = self.userDetailModelObjc?.screenName ?? ""
            self.lblUserName.text = self.userDetailModelObjc?.name ?? ""
            self.lblUserDescription.text = self.userDetailModelObjc?.description ?? ""
            self.lblUserFollowingCount.text = "\(self.userDetailModelObjc?.friendsCount ?? 0)"
            self.lblUserFollowersCount.text = "\(self.userDetailModelObjc?.followersCount ?? 0)"
            self.imgUserBanner.sd_setImage(with: URL(string: self.userDetailModelObjc?.profileBannerUrl ?? ""), placeholderImage: #imageLiteral(resourceName: "ic_tweet"))
            self.imgUserProfile.sd_setImage(with: URL(string: self.userDetailModelObjc?.profileImageUrlHttps ?? ""), placeholderImage: #imageLiteral(resourceName: "ic_tweet"))
        }
    }
    
    //MARK: IBAction
    @IBAction func btnFollowingOnClicked(_ sender: Any) {
        let vc = StoryBoard("FriendFollowingVC") as! FriendFollowingVC
        vc.userName = UserDefaults.userName
        vc.accessToken = accessToken
        vc.isFollwersSelected = false
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func btnFollowersOnClicked(_ sender: Any) {
        let vc = StoryBoard("FriendFollowingVC") as! FriendFollowingVC
        vc.userName = UserDefaults.userName
        vc.accessToken = accessToken
        vc.isFollwersSelected = true
        self.navigationController?.pushViewController(vc, animated: true)
    }        
    
    @IBAction func btnLogoutOnClicked(_ sender: Any) {
        UserDefaults.isLogin = false
        UserDefaults.userid = ""
        UserDefaults.userName = ""
        UserDefaults.userEmail = ""        
        let store = TWTRTwitter.sharedInstance().sessionStore
        store.logOutUserID(UserDefaults.userid)
        let vc = StoryBoard("HomeVC") as! HomeVC
        SlideNavigationController.sharedInstance()?.popAllAndSwitch(to: vc, withCompletion: nil)
    }
}

//MARK: Web services
extension UserProfileVC {
    func getAccessToken() {
        self.view.activityStartAnimating()
        let encodedConsumerKeyString:String = TWITTER_CONSUMER_KEY.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlHostAllowed)!
        let encodedConsumerSecretKeyString:String = TWITTER_CONSUMER_SECRTE_KEY.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlHostAllowed)!
        let combinedString = encodedConsumerKeyString+":"+encodedConsumerSecretKeyString
        let data = combinedString.data(using: .utf8)
        let encodingString = "Basic "+(data?.base64EncodedString())!
        let parameters = "grant_type=client_credentials"
        let postData = parameters.data(using: .utf8)
        
        var request = URLRequest(url: URL(string: "https://api.twitter.com/oauth2/token")!,timeoutInterval: Double.infinity)
        request.addValue(encodingString, forHTTPHeaderField: "Authorization")
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.addValue("guest_id=v1%3A162997554563551529; personalization_id=\"v1_F0S9raETLRZPo23OZSFf8g==\"", forHTTPHeaderField: "Cookie")
        request.httpMethod = "POST"
        request.httpBody = postData
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                self.view.activityStopAnimating()
                return
            }
            do {
                let response = try JSONSerialization.jsonObject(with: data, options: []) as! Dictionary<String, Any>
                print("Access Token response : \(response)")
                print(response["access_token"] as Any)
                let accessToken = response["access_token"] as? String ?? ""
                self.accessToken = accessToken
                self.getUserDetail(accessToken: accessToken)
            } catch let error as NSError {
                self.view.makeToast("\(error)")
            }
            self.view.activityStopAnimating()
        }
        task.resume()
    }

    func getUserDetail(accessToken: String) {
        self.view.activityStartAnimating()
        let url = APIConstants.UserDetail + "\(UserDefaults.userName)"
        let bearerToken = "Bearer "+accessToken
        let param : [String:Any] = ["Authorization":bearerToken]
        HttpRequestManager.shared.getMethodCall(url: url, parameter: param) { (data, error, message) in
            if data != nil {
                let decoder = JSONDecoder()
                do {
                    if let dataResult = data {
                        if let response = try JSONSerialization.jsonObject(with: dataResult, options: []) as? Dictionary<String, Any> {
                            self.userDetailModelObjc = try decoder.decode(UserDetailModel.self, from: JSON(response).rawData())
                            if self.userDetailModelObjc != nil {
                                self.setupUserDetail()
                            }
                        }
                    }
                } catch {
                    self.view.makeToast(message ?? "")
                }
            } else {
                self.view.makeToast(message ?? "")
            }
        }
        self.view.activityStopAnimating()
    }
}
