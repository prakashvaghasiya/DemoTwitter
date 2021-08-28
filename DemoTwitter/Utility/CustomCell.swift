//
//  CustomCell.swift
//  FourPic
//
//  Created by Chirag 3 on 30/08/17.
//  Copyright © 2017 jksol. All rights reserved.
//

import UIKit

class GlobalCollectionCell: UICollectionViewCell {
    
    var dict1 = NSDictionary()
    var str1 = ""
    
    @IBOutlet var view1: UIView!
    @IBOutlet var view2: UIView!
    
    @IBOutlet weak var img1: UIImageView!
    @IBOutlet weak var img2: UIImageView!
    
    @IBOutlet weak var lbl1: UILabel!
    @IBOutlet weak var lbl2: UILabel!
    @IBOutlet weak var lbl3: UILabel!
    @IBOutlet weak var lbl4: UILabel!
    
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    
    @IBOutlet var layout1: NSLayoutConstraint!
    @IBOutlet var layout2: NSLayoutConstraint!
    @IBOutlet weak var checkBox1: CheckBox!
    //    @IBOutlet weak var rateView: CosmosView!
}

class GlobalTableCell: UITableViewCell {
    
    var dict1 = NSDictionary()
    var arrData = NSArray()
    var str1 = ""
    
    @IBOutlet var view1: UIView!
    @IBOutlet var view2: UIView!
    @IBOutlet var view3: UIView!
    
    @IBOutlet weak var img1: UIImageView!
    @IBOutlet weak var img2: UIImageView!
    @IBOutlet weak var img3: UIImageView!
    @IBOutlet weak var img4: UIImageView!
    @IBOutlet weak var img5: UIImageView!
    @IBOutlet weak var img6: UIImageView!
    
    
    @IBOutlet weak var imgRound1: UIImageView!
    @IBOutlet weak var imgRound2: UIImageView!
    @IBOutlet weak var imgRound3: UIImageView!
    
    
    @IBOutlet weak var lbl1: UILabel!
    @IBOutlet weak var lbl2: UILabel!
    @IBOutlet weak var lbl3: UILabel!
    @IBOutlet weak var lbl4: UILabel!
    @IBOutlet weak var lbl5: UILabel!
    @IBOutlet weak var lbl6: UILabel!
    @IBOutlet weak var lbl7: UILabel!
    @IBOutlet weak var lbl8: UILabel!
    @IBOutlet weak var lbl9: UILabel!
    @IBOutlet weak var lbl10: UILabel!
    @IBOutlet weak var lbl11: UILabel!
    @IBOutlet weak var lbl12: UILabel!
    @IBOutlet weak var lbl13: UILabel!
    @IBOutlet weak var lbl14: UILabel!
    @IBOutlet weak var lbl15: UILabel!
    @IBOutlet weak var lbl16: UILabel!
    @IBOutlet weak var lbl17: UILabel!
    @IBOutlet weak var lbl18: UILabel!
    @IBOutlet weak var lbl19: UILabel!

    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var btn5: UIButton!
    @IBOutlet weak var btn6: UIButton!
    @IBOutlet weak var btn7: UIButton!
    @IBOutlet weak var btn8: UIButton!
    
    
    @IBOutlet var layout1: NSLayoutConstraint!
    @IBOutlet var layout2: NSLayoutConstraint!
    //    @IBOutlet weak var rateView: CosmosView!
    
    @IBOutlet weak var height0: NSLayoutConstraint!
    @IBOutlet weak var width0: NSLayoutConstraint!
    @IBOutlet weak var ratio1: NSLayoutConstraint!
    
    @IBOutlet weak var stc1: UIStackView!
    @IBOutlet weak var stc2: UIStackView!
    @IBOutlet weak var stc3: UIStackView!
    
    @IBOutlet weak var scroll1: UIScrollView!
    @IBOutlet weak var scroll2: UIScrollView!
    @IBOutlet weak var scroll3: UIScrollView!
    
    @IBOutlet weak var txtView: UITextView!

}

