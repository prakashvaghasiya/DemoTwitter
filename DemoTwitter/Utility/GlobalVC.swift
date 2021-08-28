//
//  GlobalVC.swift
//  Trove
//
//  Created by Prakash Vaghasiya on 16/02/21.
//

import UIKit

class GlobalVC: UIViewController {
    
    // MARK: - OUTLET
    @IBOutlet weak var tblView: UITableView!
    @IBOutlet var viewBold18: [UIView]!
    @IBOutlet var viewBold15: [UIView]!
    @IBOutlet var viewBold16: [UIView]!
    @IBOutlet var viewBold17: [UIView]!
    @IBOutlet var viewBold24: [UIView]!
    @IBOutlet var viewRegular10: [UIView]!
    @IBOutlet var viewRegular12: [UIView]!
    @IBOutlet var viewRegular16: [UIView]!
    @IBOutlet var viewRegular18: [UIView]!
    @IBOutlet var viewRegular20: [UIView]!
    @IBOutlet var viewRegular22: [UIView]!
    @IBOutlet var viewRegular14: [UIView]!
    @IBOutlet var viewMed18: [UIView]!
    @IBOutlet var viewMed20: [UIView]!
    @IBOutlet var viewMed16: [UIView]!
    @IBOutlet var viewMed24: [UIView]!

    // MARK: - PROPERTY
    
    // MARK: - LIFE CYCLE
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
//        setStatusbarOnTop(false, isAnimated: false)
        setStartUpNavigation(hidden: true, title: "")
        
        print(">>>>",SlideNavigationController.sharedInstance().viewControllers.last!)
        if tblView != nil {
            tblView.tableFooterView = UIView()
            tblView.rowHeight = UITableView.automaticDimension
            tblView.estimatedRowHeight = 10
        }
        
        
        //setfont(view: viewBold15, fontName: FONT_BOLD, fontSize: 15)
        //setfont(view: viewBold16, fontName: FONT_BOLD, fontSize: 16)
        //setfont(view: viewBold17, fontName: FONT_BOLD, fontSize: 17)
        //setfont(view: viewBold18, fontName: FONT_BOLD, fontSize: 18)
        //setfont(view: viewBold24, fontName: FONT_BOLD, fontSize: 24)
        //setfont(view: viewRegular10, fontName: FONT_REGULER, fontSize: 10)
        //setfont(view: viewRegular12, fontName: FONT_REGULER, fontSize: 12)
        //setfont(view: viewRegular16, fontName: FONT_REGULER, fontSize: 16)
        //setfont(view: viewRegular18, fontName: FONT_REGULER, fontSize: 18)
        //setfont(view: viewRegular20, fontName: FONT_REGULER, fontSize: 20)
        //setfont(view: viewRegular22, fontName: FONT_REGULER, fontSize: 22)
        //setfont(view: viewRegular14, fontName: FONT_REGULER, fontSize: 14)
        //setfont(view: viewMed16, fontName: FONT_MEDIUM, fontSize: 16)
        //setfont(view: viewMed18, fontName: FONT_MEDIUM, fontSize: 18)
        //setfont(view: viewMed20, fontName: FONT_MEDIUM, fontSize: 20)
        //setfont(view: viewMed24, fontName: FONT_MEDIUM, fontSize: 24)
    }
    
    // MARK: - UI SETUP
    
    // MARK: - BUTTON CLICK
    
    // MARK: - OTHER
   
    func setfont(view : [UIView]?, fontName: String, fontSize: CGFloat) {
        if view != nil {
            for view0 in view! {
                let font = UIFont(name: fontName, size: fontSize)
                if view0 is UITextField {
                    let txt = view0 as! UITextField
                    txt.font = font
                }
                if view0 is UILabel {
                    let lbl = view0 as! UILabel
                    lbl.font = font
                }
                if view0 is UIButton {
                    let lbl = view0 as! UIButton
                    lbl.titleLabel?.font = font
                }
            }
        }
    }
    // MARK: - DELEGATE
    
}
