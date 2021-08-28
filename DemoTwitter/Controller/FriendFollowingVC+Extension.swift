//
//  FriendFollowingVC+Extension.swift
//  DemoTwitter
//
//  Created by iMac on 27/08/21.
//

import Foundation

//MARK:- UITableViewDelegate, UITableViewDataSource
extension FriendFollowingVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FriendCell.identifier, for: indexPath) as? FriendCell else { return UITableViewCell() }
        cell.selectionStyle = .none
        DispatchQueue.main.async {
            cell.configuresCell(userDetail: self.users[indexPath.row])
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == (users.count - 1) {
            if friendListModelObjc?.nextCursor ?? 0 != 0 {
                if isFollwersSelected {
                    getUserFollowers(Curser: "\(friendListModelObjc?.nextCursor ?? 0)")
                } else {
                    getUserFriendList(Curser: "\(friendListModelObjc?.nextCursor ?? 0)")
                }
            }
        }
    }
}
