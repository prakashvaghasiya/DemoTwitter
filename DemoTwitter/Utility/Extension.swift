//
//  Extension.swift
//  JyLike
//
//  Created by sejal on 06/03/19.
//  Copyright © 2019 sejal. All rights reserved.
//

import UIKit
import MapKit
import Foundation
import UIKit
import AVKit
import Contacts
import ContactsUI

let activityIndicatorView = NVActivityIndicatorView(frame: CGRect.zero)
let navigationBarHeight: CGFloat = UINavigationController().navigationBar.frame.height + UIApplication.shared.statusBarFrame.height

func RGBColor(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) -> UIColor {
    return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
}

func StoryBoard(_ identifier : String) -> UIViewController {
    return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: identifier)
}

func StoryBoard(_ storyboard: StoryBoardName, _ identifier : String) -> UIViewController {
    return UIStoryboard(name: storyboard.rawValue, bundle: nil).instantiateViewController(withIdentifier: identifier)
}

enum StoryBoardName : String{
    case main = "Main"
    case homehealthcare = "HomeHalthCare"
    case homecare = "HomeCare"
    case pharmacy = "Pharmacy"
    case doctor = "Doctor"
    case hospice = "Hospice"
    case mobileDiagnostic = "MobileDiagnostic"
    case residence = "Residence"
    case dme = "DME"
}

extension UIViewController {
    
    func loadingKVN() {
        KVNProgress.show(withStatus: "Loading...")
    }
    
    /**
     phone number
     */
    func isValidPhoneNumber(testStr:String) -> Bool {
        let regex : NSString = "^[0-9]\\d{9}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        
        return predicate.evaluate(with: testStr)
    }
    
    func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    func dicToStr(responce: NSDictionary) -> String {
        let dictionary = responce
        let jsonData = try? JSONSerialization.data(withJSONObject: dictionary, options: [])
        let jsonString = String(data: jsonData!, encoding: .utf8)
        return jsonString!
    }
    
    func strTodic(string: String) -> NSDictionary {
        let jsonString = string
        let jsonData = jsonString.data(using: .utf8)!
        let dictionary = try? JSONSerialization.jsonObject(with: jsonData, options: .mutableLeaves)
        return dictionary as! NSDictionary
    }
    
    func arrToStr(responce: NSArray) -> String {
        let dictionary = responce
        let jsonData = try? JSONSerialization.data(withJSONObject: dictionary, options: [])
        let jsonString = String(data: jsonData!, encoding: .utf8)
        return jsonString!
    }
    
    func strToArr(string: String) -> NSArray {
        let jsonString = string
        let jsonData = jsonString.data(using: .utf8)!
        let dictionary = try? JSONSerialization.jsonObject(with: jsonData, options: .mutableLeaves)
        return dictionary as! NSArray
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @IBAction func backDefault(_ sender: UIButton?) {        
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func backCustomDefault(_ sender: UIButton?) {
        //let vc = StoryBoard("Home") as! Home
        //self.navigationController?.popToViewController(vc, animated: true)
    }
    
    @IBAction func dismisDefault(_ sender: UIButton?) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func setStatusbarOnTop(_ isTop: Bool, isAnimated: Bool) {
        if !isTop {
            if isAnimated {
                UIView.animate(withDuration: 0.5, animations: {() -> Void in
                    UIApplication.shared.delegate?.window??.windowLevel = UIWindow.Level.statusBar + 1
                })
            }
            else {
                UIApplication.shared.delegate?.window??.windowLevel = UIWindow.Level.statusBar + 1
            }
        }
        else {
            if isAnimated {
                UIView.animate(withDuration: 0.5, animations: {() -> Void in
                    UIApplication.shared.delegate?.window??.windowLevel = UIWindow.Level.normal
                })
            }
            else {
                UIApplication.shared.delegate?.window??.windowLevel = UIWindow.Level.normal
            }
        }
    }
    
    func openURL(_ website : String) {
        if let url = URL(string: website) {
            if UIApplication.shared.canOpenURL(url) {
                if #available(iOS 10.0, *) {
                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                } else {
                    UIApplication.shared.openURL(url)
                }
            }
        }
    }
    func setStartUpNavigation(hidden: Bool, title: String) {
        
        activityIndicatorView.color = .blue
        activityIndicatorView.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        activityIndicatorView.center = CGPoint(x: SCREEN_WIDTH * 0.5, y: navigationBarHeight + 130)
        self.view.addSubview(activityIndicatorView)
        activityIndicatorView.type = .ballRotateChase
        activityIndicatorView.stopAnimating()
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        SlideNavigationController.sharedInstance().navigationBar.isHidden = hidden
        SlideNavigationController.sharedInstance().navigationBar.barTintColor = .blue
        SlideNavigationController.sharedInstance().navigationBar.barStyle = .blackTranslucent
        SlideNavigationController.sharedInstance().navigationBar.tintColor = UIColor.white
        SlideNavigationController.sharedInstance().enableSwipeGesture = false
        
        self.title = title
        //        self.view.backgroundColor = BGColor
        self.setNeedsStatusBarAppearanceUpdate()
    }
    
    func popViewController(_ number: Int) {
        if let viewControllers: [UIViewController] = self.navigationController?.viewControllers {
            guard viewControllers.count < number-1 else {
                self.navigationController?.popToViewController(viewControllers[viewControllers.count - number - 1], animated: true)
                return
            }
        }
    }
    
    func gotoLogin() {
        //let vc = StoryBoard("Login") as! Login
        //SlideNavigationController.sharedInstance()?.popAllAndSwitch(to: vc, withCompletion: nil)
    }
    
    func gotoRegister() {
        //let vc = StoryBoard("StartUpVC") as! StartUpVC
        //SlideNavigationController.sharedInstance()?.popAllAndSwitch(to: vc, withCompletion: nil)
    }
    
    func tableSetup(tblView : UITableView) {
        tblView.rowHeight = UITableView.automaticDimension
        tblView.estimatedRowHeight = 44
        tblView.tableFooterView = UIView()
    }
    
    func gotoHome() {
        //let vc = StoryBoard("Home") as! Home //Home
        //SlideNavigationController.sharedInstance()?.popAllAndSwitch(to: vc, withCompletion: nil)
    }
    
    func gotoTab() {
        //let vc = StoryBoard("HomeVC") as! HomeVC
        //SlideNavigationController.sharedInstance()?.popAllAndSwitch(to: vc, withCompletion: nil)
    }
        
    @IBAction func contact() {
        if let url = URL(string: "tel://\("9998758425")"),
           UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    @IBAction func toggleLeft() {
        SlideNavigationController.sharedInstance()?.toggleLeftMenu()
    }
    
    @IBAction func search() {
        //let vc = StoryBoard("SearchChef") as! SearchChef
        //vc.isFromSearch = true
        //SlideNavigationController.sharedInstance().pushViewController(vc, animated: true)
    }
        
    @IBAction func cart_pressed(_ sender: UIButton) {

    }
    @IBAction func image_pressed(_ sender: UIButton) {
        view.endEditing(true)
        let alert = UIAlertController(title: nil, message: "Choose your source", preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "Camera", style: UIAlertAction.Style.default) { (result : UIAlertAction) -> Void in
            print("Camera selected")
            if UIImagePickerController.isSourceTypeAvailable(.camera){
                let imag = UIImagePickerController()
                imag.delegate = (self as! UIImagePickerControllerDelegate & UINavigationControllerDelegate)
                imag.sourceType = .camera;
                //imag.mediaTypes = [kUTTypeImage];
                imag.allowsEditing = false
                self.present(imag, animated: true, completion: nil)
            }
        })
        alert.addAction(UIAlertAction(title: "Photo library", style: UIAlertAction.Style.default) { (result : UIAlertAction) -> Void in
            print("Photo selected")
            
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
                let imag = UIImagePickerController()
                imag.delegate = (self as! UIImagePickerControllerDelegate & UINavigationControllerDelegate)
                imag.sourceType = .photoLibrary;
                //imag.mediaTypes = [kUTTypeImage];
                imag.allowsEditing = false
                self.present(imag, animated: true, completion: nil)
            }
        })
        self.present(alert, animated: true, completion: nil)
    }
    func localToUTC(date:String, inFormat:String, outFormat:String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = inFormat
        dateFormatter.calendar = NSCalendar.current
        dateFormatter.timeZone = TimeZone.current
        
        let dt = dateFormatter.date(from: date)
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        dateFormatter.dateFormat = outFormat
        
        return dateFormatter.string(from: dt!)
    }
    
    func strToDate(date:String, inFormat:String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = inFormat
        dateFormatter.calendar = NSCalendar.current
        dateFormatter.timeZone = TimeZone.current
        
        let dt = dateFormatter.date(from: date)
        
        return dt
    }
    
    func UTCToLocal(date:String, inFormat:String, outFormat:String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = inFormat
        //        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        
        let dt = dateFormatter.date(from: date)
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.dateFormat = outFormat
        
        return (dt != nil) ? dateFormatter.string(from: dt!) : ""
        
    }
    
    func randomString(length: Int) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        return String((0..<length).map{ _ in letters.randomElement()! })
    }
    
    func delay(interval: TimeInterval, closure: @escaping () -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + interval) {
            closure()
        }
    }
    func determineMyCurrentLocation(vc : UIViewController, locationManager: CLLocationManager) {
        locationManager.delegate = vc as! CLLocationManagerDelegate
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            
            switch(CLLocationManager.authorizationStatus()) {
            //check if services disallowed for this app particularly
            case .restricted, .denied:
                print("No access")
                let accessAlert = UIAlertController(title: "Location Services Disabled", message: "You need to enable location services in settings.", preferredStyle: UIAlertController.Style.alert)
                
                accessAlert.addAction(UIAlertAction(title: "Okay!", style: .default, handler: { (action: UIAlertAction!) in UIApplication.shared.openURL(NSURL(string:UIApplication.openSettingsURLString)! as URL)
                }))
                
                present(accessAlert, animated: true, completion: nil)
                
            //check if services are allowed for this app
            case .authorizedAlways, .authorizedWhenInUse:
                print("Access! We're good to go!")
                locationManager.startUpdatingLocation()
            //check if we need to ask for access
            case .notDetermined:
                print("asking for access...")
                locationManager.requestAlwaysAuthorization()
                
            @unknown default:
                print("unknown...")
            }
            //location services are disabled on the device entirely!
        } else {
            print("Location services are not enabled")
            
        }
    }
    func callNumber(phoneNumber:String) {
        
        if let phoneCallURL = URL(string: "telprompt://\(phoneNumber)") {
            
            let application:UIApplication = UIApplication.shared
            if (application.canOpenURL(phoneCallURL)) {
                if #available(iOS 10.0, *) {
                    application.open(phoneCallURL, options: [:], completionHandler: nil)
                } else {
                    // Fallback on earlier versions
                    application.openURL(phoneCallURL as URL)
                    
                }
            }
        }
    }
    
}

extension UITableViewCell {
    
    // Return Nib
    public static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    // Return Identifier
    public static var identifier: String {
        return String(describing: self)
    }
}

func random(min: Int, max: Int) -> Int {
    return Int(arc4random_uniform(UInt32(max - min + 1))) + min
}

@objc
class UITextViewWorkaround : NSObject {
    
    static func executeWorkaround() {
        if #available(iOS 13.2, *) {
        } else {
            let className = "_UITextLayoutView"
            let theClass = objc_getClass(className)
            if theClass == nil {
                let classPair: AnyClass? = objc_allocateClassPair(UIView.self, className, 0)
                objc_registerClassPair(classPair!)
            }
        }
    }
    
}

extension AppDelegate {
    func fontPrint() {
        for family in UIFont.familyNames {
            print("\(family)")
            
            for name in UIFont.fontNames(forFamilyName: family) {
                print(" \(name)")
            }
        }
    }
}

extension UICollectionViewCell {
    
    // Return Nib
    public static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    // Return Identifier
    public static var identifier: String {
        return String(describing: self)
    }
}

//@IBDesignable
extension UIView {
    
    /// When positive, the background of the layer will be drawn with rounded corners. Also effects the mask generated by the `masksToBounds' property. Defaults to zero. Animatable.
    @IBInspectable var cornerRadius: Double {
        get {
            return Double(self.layer.cornerRadius)
        }
        set {
            self.layer.cornerRadius = CGFloat(newValue)
        }
    }
    
    /// The width of the layer's border, inset from the layer bounds. The border is composited above the layer's content and sublayers and includes the effects of the `cornerRadius' property. Defaults to zero. Animatable.
    @IBInspectable var borderWidth: Double {
        get {
            return Double(self.layer.borderWidth)
        }
        set {
            self.layer.borderWidth = CGFloat(newValue)
        }
    }
    
    /// The color of the layer's border. Defaults to opaque black. Colors created from tiled patterns are supported. Animatable.
    @IBInspectable var borderColor: UIColor? {
        get {
            return UIColor(cgColor: self.layer.borderColor!)
        }
        set {
            self.layer.borderColor = newValue?.cgColor
        }
    }
    
    /// The color of the shadow. Defaults to opaque black. Colors created from patterns are currently NOT supported. Animatable.
    @IBInspectable var shadowColor: UIColor? {
        get {
            return UIColor(cgColor: self.layer.shadowColor!)
        }
        set {
            self.layer.shadowColor = newValue?.cgColor
        }
    }
    
    /// The opacity of the shadow. Defaults to 0. Specifying a value outside the [0,1] range will give undefined results. Animatable.
    @IBInspectable var shadowOpacity: Float {
        get {
            return self.layer.shadowOpacity
        }
        set {
            self.layer.shadowOpacity = newValue
        }
    }
    
    /// The shadow offset. Defaults to (0, -3). Animatable.
    @IBInspectable var shadowOffset: CGSize {
        get {
            return self.layer.shadowOffset
        }
        set {
            self.layer.shadowOffset = newValue
        }
    }
    
    /// The blur radius used to create the shadow. Defaults to 3. Animatable.
    @IBInspectable var shadowRadius: Double {
        get {
            return Double(self.layer.shadowRadius)
        }
        set {
            self.layer.shadowRadius = CGFloat(newValue)
        }
    }
    
    enum Corner:Int {
        case bottomRight = 0,
             topRight,
             bottomLeft,
             topLeft
    }
    
    private func parseCorner(corner: Corner) -> CACornerMask.Element {
        let corners: [CACornerMask.Element] = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMinXMinYCorner]
        return corners[corner.rawValue]
    }
    
    private func createMask(corners: [Corner]) -> UInt {
        return corners.reduce(0, { (a, b) -> UInt in
            return a + parseCorner(corner: b).rawValue
        })
    }
    
    func roundCorners(corners: [Corner], amount: CGFloat = 7) {
        layer.cornerRadius = amount
        let maskedCorners: CACornerMask = CACornerMask(rawValue: createMask(corners: corners))
        layer.maskedCorners = maskedCorners
    }
    
    func rotate(_ angle: CGFloat) {
        let radians = angle / 180.0 * CGFloat.pi
        let rotation = self.transform.rotated(by: radians);
        self.transform = rotation
    }
    
    func rotateInit() {
        self.transform = .identity
    }
    
}

class SSView: UIView {
    
    @IBInspectable var radious: CGFloat = 5 {
        didSet {
            self.layer.shadowRadius = radious
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews(){
        super.layoutSubviews()
        
    }
}

//@IBDesignable
class TextField: UITextField {
    @IBInspectable var insetX: CGFloat = 0
    @IBInspectable var insetY: CGFloat = 0
    
    // placeholder position
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: insetX, dy: insetY)
    }
    
    // text position
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: insetX, dy: insetY)
    }
}

extension UITextField{
    @IBInspectable var placeHolderColor: UIColor? {
        get {
            return self.placeHolderColor
        }
        set {
            self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: newValue!])
        }
    }
}

class VerticalTopAlignLabel: UILabel {
    
    override func drawText(in rect:CGRect) {
        guard let labelText = text else {  return super.drawText(in: rect) }
        
        let attributedText = NSAttributedString(string: labelText, attributes: [NSAttributedString.Key.font: font])
        var newRect = rect
        newRect.size.height = attributedText.boundingRect(with: rect.size, options: .usesLineFragmentOrigin, context: nil).size.height
        
        if numberOfLines != 0 {
            newRect.size.height = min(newRect.size.height, CGFloat(numberOfLines) * font.lineHeight)
        }
        
        super.drawText(in: newRect)
    }
    
}
extension NSMutableString {
    func insertSafetly(_ newString: String, at: Int) {
        if at <= self.length {
            self.insert(newString, at: at)
        }
    }
}
extension String {
    
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
    
        return ceil(boundingBox.height)
    }

    func width(withConstrainedHeight height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)

        return ceil(boundingBox.width)
    }
    
    func removeExtraCharacter() -> String {
        var new = self.replacingOccurrences(of: "#", with: "")
        //        new = new.replacingOccurrences(of: ")", with: "")
        //        new = new.replacingOccurrences(of: " ", with: "")
        //        new = new.replacingOccurrences(of: "-", with: "")
        //        new = new.replacingOccurrences(of: "*", with: "")
        
        return new
    }
    
    func removeAllExtraCharacter() -> String {
        var new = self.replacingOccurrences(of: "#", with: "")
        new = new.replacingOccurrences(of: ")", with: "")
        new = new.replacingOccurrences(of: " ", with: "")
        new = new.replacingOccurrences(of: "-", with: "")
        new = new.replacingOccurrences(of: "*", with: "")
        
        return new
    }
    
    var html2AttributedString: NSAttributedString? {
        return Data(utf8).html2AttributedString
    }
    var html2String: String {
        return html2AttributedString?.string ?? ""
    }
    
    func dicToStr(responce: NSDictionary) -> String {
        let dictionary = responce
        let jsonData = try? JSONSerialization.data(withJSONObject: dictionary, options: [])
        let jsonString = String(data: jsonData!, encoding: .utf8)
        return jsonString!
    }
    
    //Converts String to Int
    public func toInt() -> Int? {
        if let num = NumberFormatter().number(from: self) {
            return num.intValue
        } else {
            return nil
        }
    }
    
    //Converts String to Double
    public func toDouble() -> Double? {
        if let num = NumberFormatter().number(from: self) {
            return num.doubleValue
        } else {
            return nil
        }
    }
    
    /// EZSE: Converts String to Float
    public func toFloat() -> Float? {
        if let num = NumberFormatter().number(from: self) {
            return num.floatValue
        } else {
            return nil
        }
    }
    
    //Converts String to Bool
    public func toBool() -> Bool? {
        return (self as NSString).boolValue
    }
    
    func trim() -> String {
        return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
    
    var underLined: NSAttributedString {
            NSMutableAttributedString(string: self, attributes: [.underlineStyle: NSUnderlineStyle.single.rawValue])
        }
}
extension Data {
    var html2AttributedString: NSAttributedString? {
        do {
            return try NSAttributedString(data: self, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            print("error:", error)
            return  nil
        }
    }
    var html2String: String {
        return html2AttributedString?.string ?? ""
    }
}
extension StringProtocol  {
    var digits: [Int] {
        return compactMap{ $0.wholeNumberValue }
    }
}
extension LosslessStringConvertible {
    var string: String { return String(self) }
}
extension Int {
    var digits: [Int] {
        return string.digits
    }
}

extension UIScrollView {
    func scrollToBottom(animated: Bool) {
        if self.contentSize.height < self.bounds.size.height { return }
        let bottomOffset = CGPoint(x: 0, y: self.contentSize.height - self.bounds.size.height)
        self.setContentOffset(bottomOffset, animated: animated)
    }
}

extension UIImage {
    
    public func maskWithColor(color: UIColor) -> UIImage {
        
        UIGraphicsBeginImageContextWithOptions(self.size, false, self.scale)
        let context = UIGraphicsGetCurrentContext()!
        
        let rect = CGRect(origin: CGPoint.zero, size: size)
        
        color.setFill()
        self.draw(in: rect)
        
        context.setBlendMode(.sourceIn)
        context.fill(rect)
        
        let resultImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return resultImage
    }
    
}

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}
extension UIColor {
    static func random() -> UIColor {
        return UIColor(red:   .random(),
                       green: .random(),
                       blue:  .random(),
                       alpha: 1.0)
    }
}

//@IBDesignable
class UIRoundedImageView: UIImageView {
    
    @IBInspectable var isRoundedCorners: Bool = false {
        didSet { setNeedsLayout() }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if isRoundedCorners {
            let shapeLayer = CAShapeLayer()
            shapeLayer.path = UIBezierPath(ovalIn:
                                            CGRect(x: bounds.origin.x, y: bounds.origin.y, width: bounds.width, height: bounds.height
                                            )).cgPath
            layer.mask = shapeLayer
        }
        else {
            layer.mask = nil
        }
        
    }
    
}
extension UIApplication {
    
    var visibleViewController: UIViewController? {
        
        guard let rootViewController = keyWindow?.rootViewController else {
            return nil
        }
        
        return getVisibleViewController(rootViewController)
    }
    
    private func getVisibleViewController(_ rootViewController: UIViewController) -> UIViewController? {
        
        if let presentedViewController = rootViewController.presentedViewController {
            return getVisibleViewController(presentedViewController)
        }
        
        if let navigationController = rootViewController as? UINavigationController {
            return navigationController.visibleViewController
        }
        
        if let tabBarController = rootViewController as? UITabBarController {
            return tabBarController.selectedViewController
        }
        
        return rootViewController
    }
}
extension UIColor {
    public convenience init(hex: String) {
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 1
        
        let hexColor = hex.replacingOccurrences(of: "#", with: "")
        let scanner = Scanner(string: hexColor)
        var hexNumber: UInt64 = 0
        var valid = false
        
        if scanner.scanHexInt64(&hexNumber) {
            if hexColor.count == 8 {
                r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                a = CGFloat(hexNumber & 0x000000ff) / 255
                valid = true
            }
            else if hexColor.count == 6 {
                r = CGFloat((hexNumber & 0xff0000) >> 16) / 255
                g = CGFloat((hexNumber & 0x00ff00) >> 8) / 255
                b = CGFloat(hexNumber & 0x0000ff) / 255
                valid = true
            }
        }
        
        #if DEBUG
        assert(valid, "UIColor initialized with invalid hex string")
        #endif
        
        self.init(red: r, green: g, blue: b, alpha: a)
    }
}

extension UIView {
    
    func activityStartAnimating(){
        DispatchQueue.main.async {
            let backgroundView = UIView()
            backgroundView.frame = CGRect.init(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height)
            //backgroundView.alpha = 0.1
            backgroundView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5034979995)
            backgroundView.tag = 475647
            self.addSubview(backgroundView)
            
            let containerView = UIView()
            containerView.frame = CGRect.init(x: 0, y: 0, width: 175, height: 160)
            containerView.center = CGPoint(x:backgroundView.bounds.width/2,y:backgroundView.bounds.height/2)
            containerView.layer.cornerRadius = 10
            containerView.backgroundColor = UIColor.clear
            //containerView.alpha = 0.8
            backgroundView.addSubview(containerView)
            
            var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
            activityIndicator = UIActivityIndicatorView(frame: CGRect.init(x: 0, y: 0, width: 100, height: 100))
            activityIndicator.center = CGPoint(x:containerView.bounds.width/2,y:containerView.bounds.height/2)
            activityIndicator.hidesWhenStopped = true
            activityIndicator.style = UIActivityIndicatorView.Style.whiteLarge
            activityIndicator.color = UIColor(named: "BtnColor")
            activityIndicator.startAnimating()
            self.isUserInteractionEnabled = false
            containerView.addSubview(activityIndicator)
            
            let lblLoading = UILabel()
            lblLoading.frame = CGRect(x: 0, y: containerView.bounds.height-30, width: containerView.bounds.width, height: 25)
            //lblLoading.text = "Loading..."
            lblLoading.font = lblLoading.font.withSize(22)
            lblLoading.textAlignment = NSTextAlignment.center
            lblLoading.textColor = UIColor.white
            containerView.addSubview(lblLoading)
        }
    }
    
    func activityStopAnimating() {
        DispatchQueue.main.async {
            if let background = self.viewWithTag(475647){
                background.removeFromSuperview()
            }
            self.isUserInteractionEnabled = true
        }
    }
    
    
    func setGradientBackground(colorTop: UIColor, colorBottom: UIColor, cornerRadius: CGFloat, viewFrame:CGRect, currentView:UIView ) {
        
        currentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            currentView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            currentView.topAnchor.constraint(equalTo: self.bottomAnchor, constant: 16.0),
            currentView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8.0),
            currentView.heightAnchor.constraint(equalTo: self.heightAnchor),
            currentView.widthAnchor.constraint(equalTo: self.widthAnchor)
        ])
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorBottom.cgColor, colorTop.cgColor]
        gradientLayer.transform = CATransform3DMakeRotation(.pi / 2, 0, 0, 1)
        gradientLayer.frame = bounds
        gradientLayer.cornerRadius = cornerRadius
        layer.cornerRadius = cornerRadius
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func setGradientBackground(colorTop: UIColor, colorBottom: UIColor, cornerRadius: CGFloat, frame: CGRect) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorBottom.cgColor, colorTop.cgColor]
        gradientLayer.transform = CATransform3DMakeRotation(.pi / 2, 0, 0, 1)
        gradientLayer.frame = frame
        gradientLayer.cornerRadius = cornerRadius
        layer.cornerRadius = cornerRadius
        if layer.sublayers?.count ?? 0 >= 1 {
            layer.sublayers?.remove(at: 0)
        }
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func addGradientBackground(firstColor: UIColor, secondColor: UIColor){
        clipsToBounds = true
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [firstColor.cgColor, secondColor.cgColor]
        gradientLayer.frame = self.bounds
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0, y: 1)
        print(gradientLayer.frame)
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func setGradientBackgroundwithDirection(colorTop: UIColor, colorBottom: UIColor, cornerRadius: CGFloat, viewFrame:CGRect, currentView:UIView ) {
        
        currentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            currentView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            currentView.topAnchor.constraint(equalTo: self.bottomAnchor, constant: 16.0),
            currentView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8.0),
            currentView.heightAnchor.constraint(equalTo: self.heightAnchor),
            currentView.widthAnchor.constraint(equalTo: self.widthAnchor)
        ])
        
        var gradientLayer = CAGradientLayer()
        if let existingLayer = (layer.sublayers?.compactMap { $0 as? CAGradientLayer })?.first {
            gradientLayer = existingLayer
        }
        gradientLayer.colors = [colorBottom.cgColor, colorTop.cgColor]
        gradientLayer.transform = CATransform3DMakeRotation(.pi / 2, 0, 0, 1)
        gradientLayer.frame = bounds
        gradientLayer.startPoint = CGPoint(x: 1, y: 1)
        gradientLayer.endPoint = CGPoint(x: 0, y: 0)
        gradientLayer.cornerRadius = cornerRadius
        layer.cornerRadius = cornerRadius
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
    // SET SHADOW
    func setShadow() {
        layer.shadowColor = UIColor.lightGray.cgColor//UIColor.black.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        layer.shadowRadius = 3.0
    }
    func setShadowRed() {
        layer.shadowColor = UIColor.red.cgColor//UIColor.black.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        layer.shadowRadius = 3.0
    }
    func roundViewCorners(_ corners: UIRectCorner, radius: CGFloat) {
        if #available(iOS 11.0, *) {
            clipsToBounds = true
            layer.cornerRadius = radius
            layer.maskedCorners = CACornerMask(rawValue: corners.rawValue)
        } else {
            let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
            let mask = CAShapeLayer()
            mask.path = path.cgPath
            layer.mask = mask
        }
    }
    
    class var nibView: UINib? {
      return UINib(nibName: String(describing: self), bundle: nil)
    }
    //::
    public func addShadowWithCornerRadius(cornerRadius: CGFloat, maskedCorners: CACornerMask, color: UIColor, offset: CGSize, opacity: Float, shadowRadius: CGFloat) {
        self.layer.cornerRadius = cornerRadius
        self.layer.maskedCorners = maskedCorners
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOffset = offset
        self.layer.shadowOpacity = opacity
        self.layer.shadowRadius = shadowRadius
    }
    
    public func addShadow(color: UIColor, opacity: Float, offset: CGSize, radius: CGFloat) {
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOpacity = opacity
        self.layer.shadowOffset = offset
        self.layer.shadowRadius = radius
        self.layer.masksToBounds = false
    }
    
    public func addCornerRadius(_ radius: CGFloat) {
        self.layer.cornerRadius = radius
    }
    
    public func applyBorder(_ width: CGFloat, borderColor: UIColor) {
        self.layer.borderWidth = width
        self.layer.borderColor = borderColor.cgColor
    }
    
    func addDragging(){
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(draggedAction(_ :)))
        self.addGestureRecognizer(panGesture)
    }
    
    @objc private func draggedAction(_ pan:UIPanGestureRecognizer){
        
        let translation = pan.translation(in: self.superview)
        self.center = CGPoint(x: self.center.x + translation.x, y: self.center.y + translation.y)
        pan.setTranslation(CGPoint.zero, in: self.superview)
    }
    
    func takeScreenshot() -> UIImage {
        
        // Begin context
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, false, UIScreen.main.scale)
        // Draw view in that context
        drawHierarchy(in: self.bounds, afterScreenUpdates: true)
        // And finally, get image
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        if (image != nil)
        {
            return image!
        }
        return UIImage()
    }
    
    enum ViewSide {
        case Top, Bottom, Left, Right
    }

    func addBorder(toSide side: ViewSide, withColor color: UIColor, andThickness thickness: CGFloat) {

        let border = CALayer()
        border.backgroundColor = color.cgColor

        switch side {
        case .Top:
            border.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: thickness)
        case .Bottom:
            border.frame = CGRect(x: 0, y: frame.size.height - thickness, width: frame.size.width, height: thickness)
        case .Left:
            border.frame = CGRect(x: 0, y: 0, width: thickness, height: frame.size.height)
        case .Right:
            border.frame = CGRect(x: frame.size.width - thickness, y: 0, width: thickness, height: frame.size.height)
        }

        layer.addSublayer(border)
    }
    
    //::
}
