//
//  FriendFollowingVC.swift
//  DemoTwitter
//
//  Created by iMac on 27/08/21.
//

import UIKit
import SwiftyJSON
import Toast_Swift
class FriendFollowingVC: UIViewController {
    
    //MARK: IBOutlet
    @IBOutlet weak var tblFriendList: UITableView!
    @IBOutlet weak var lblNavigationTitle: UILabel!
    
    //MARK: Variables
    var friendListModelObjc: FriendsLisModel?
    var users = [Users]()
    var accessToken = ""
    var userName = ""
    var isFollwersSelected: Bool = false
    
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    //MARK: Methods
    private func setupUI() {
        setupNavigationBar()
        setupTableView()
        if isFollwersSelected {
            users.removeAll()
            getUserFollowers(Curser: "-1")
        } else {
            users.removeAll()
            getUserFriendList(Curser: "-1")
        }
    }
    
    private func setupNavigationBar() {
        if isFollwersSelected {
            self.lblNavigationTitle.text = "Followers"
        } else {
            self.lblNavigationTitle.text = "Following/FriendList"            
        }
    }
    
    private func setupTableView() {
        tblFriendList.register(FriendCell.nib, forCellReuseIdentifier: FriendCell.identifier)
        tblFriendList.reloadData()
    }
        
    //MARK: IBAction
    @IBAction func btnBackOnClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}

//MARK: Web service
extension FriendFollowingVC {
    func getUserFriendList(Curser: String) {
        self.view.activityStartAnimating()
        self.view.activityStartAnimating()
        let url = APIConstants.FriendList + "\(userName)&count=10&skip_status=true&include_user_entities=false&cursor=\(Curser)"
        let bearerToken = "Bearer "+accessToken
        let param : [String:Any] = ["Authorization":bearerToken]
        HttpRequestManager.shared.getMethodCall(url: url, parameter: param) { (data, error, message) in
            if data != nil {
                let decoder = JSONDecoder()
                do {
                    if let dataResult = data {
                        if let response = try JSONSerialization.jsonObject(with: dataResult, options: []) as? Dictionary<String, Any> {
                            self.friendListModelObjc = try decoder.decode(FriendsLisModel.self, from: JSON(response).rawData())
                            if self.friendListModelObjc != nil {
                                if let users = self.friendListModelObjc?.users {
                                    for userDetail in users {
                                        self.users.append(userDetail)
                                    }
                                }
                            }
                            DispatchQueue.main.async {
                                self.tblFriendList.reloadData()
                                self.view.activityStopAnimating()
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
    
    func getUserFollowers(Curser: String) {
        self.view.activityStartAnimating()
        let url = APIConstants.FollowersList + "\(userName)&count=10&skip_status=true&include_user_entities=false&cursor=\(Curser)"
        let bearerToken = "Bearer "+accessToken
        let param : [String:Any] = ["Authorization":bearerToken]
        HttpRequestManager.shared.getMethodCall(url: url, parameter: param) { (data, error, message) in
            if data != nil {
                let decoder = JSONDecoder()
                do {
                    if let dataResult = data {
                        if let response = try JSONSerialization.jsonObject(with: dataResult, options: []) as? Dictionary<String, Any> {
                            self.friendListModelObjc = try decoder.decode(FriendsLisModel.self, from: JSON(response).rawData())
                            if self.friendListModelObjc != nil {
                                if let users = self.friendListModelObjc?.users {
                                    for userDetail in users {
                                        self.users.append(userDetail)
                                    }
                                }
                            }
                            DispatchQueue.main.async {
                                self.tblFriendList.reloadData()
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
