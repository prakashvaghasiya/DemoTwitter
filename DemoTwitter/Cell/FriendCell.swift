//
//  FriendCell.swift
//  DemoTwitter
//
//  Created by iMac on 27/08/21.
//

import UIKit
import Alamofire
class FriendCell: UITableViewCell {

    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblFollowingCount: UILabel!
    @IBOutlet weak var lblFollowesCount: UILabel!
    
    //MARK:- Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    //MARK:- Methods
    func configuresCell(userDetail: Users) {
        //DispatchQueue.main.async {
            self.lblName.text = userDetail.name ?? ""
            self.lblFollowesCount.text = "\(userDetail.followersCount ?? 0)"
            self.lblFollowingCount.text = "\(userDetail.friendsCount ?? 0)"
            self.imgProfile.sd_setImage(with: URL(string: userDetail.profileImageUrlHttps ?? ""), placeholderImage: #imageLiteral(resourceName: "ic_tweet"))
        //}
    }
    
}
