//
//  String.swift
//  RentalHomeUser
//
//  Created by Nikul on 15/04/20.
//  Copyright © 2019 DayDreamSoft. All rights reserved.
//

import UIKit

extension String: Error {}

extension String {
    
    func fromBase64() -> String? {
        guard let data = Data(base64Encoded: self) else {
            return ""
        }
        
        return String(data: data, encoding: .utf8)
    }
    
    func toBase64() -> String {
        return Data(self.utf8).base64EncodedString()
    }
    
    func isValid() -> Bool {
        return (self.isEmpty || self == "" || self == nil || self == "(null)") || self.blank() ? false : true
        
    }
    
    func blank() -> Bool {
        let trimmed = self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        return trimmed.isEmpty
    }
    
    
    func isBegin(with string:NSString) -> Bool {
        return self.hasPrefix(string as String) ? true : false
    }
    
    func isEnd(With string : NSString) -> Bool {
        return self.hasSuffix(string as String) ? true : false
    }
    
    func deletingPrefix(_ prefix: String) -> String {
        guard self.hasPrefix(prefix) else { return self }
        return String(self.dropFirst(prefix.count))
    }
    
    /**
     Check email
     */
    func isValidEmail() -> Bool {
        let regex : NSString = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        
        return predicate.evaluate(with: self)
    }
    
    func isValidPassword() -> Bool {
        let regex : NSString = "^(?=.*[a-z])(?=.*)(?=.*\\d)(?=.*[$@$!%*?&])[a-z\\d$@$!%*?&]{8,}"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        
        return predicate.evaluate(with: self)
    }
    /**
     phone number
     */
    func isValidPhoneNumber() -> Bool {
        let regex : NSString = "[235689][0-9]{6}([0-9]{3})?"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        
        return predicate.evaluate(with: self)
    }
    
    /**
     url
     */
    func isValidUrl() -> Bool {
        let regex : NSString = "(http|https)://((\\w)*|([0-9]*)|([-|_])*)+([\\.|/]((\\w)*|([0-9]*)|([-|_])*))+"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        
        return predicate.evaluate(with: self)
    }
    
    func substring(_ startIndex: Int, length: Int) -> String {
        let start =  self.index(self.startIndex, offsetBy: startIndex)
        let end = self.index(self.startIndex, offsetBy: startIndex + length)
        return String(self[start..<end])
    }
    
    func hexStringToUIColor () -> UIColor {
        var cString:String = self.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    func toJSON() -> Any? {
        guard let data = self.data(using: .utf8, allowLossyConversion: false) else { return nil }
        return try? JSONSerialization.jsonObject(with: data, options: .mutableContainers)
    }
    
    func htmlToAttributes() -> NSMutableAttributedString {
        let htmlData = NSString(string: self).data(using: String.Encoding.unicode.rawValue)
        let options = [NSAttributedString.DocumentReadingOptionKey.documentType:
            NSAttributedString.DocumentType.html]
        let attributedString = (try? NSMutableAttributedString(data: htmlData ?? Data(),
                                                               options: options,
                                                               documentAttributes: nil)) ?? NSMutableAttributedString (string: self)
        return attributedString
    }
    
    func applyPatternOnNumbers(pattern: String, replacmentCharacter: Character) -> String {
        var pureNumber = self.replacingOccurrences( of: "[^0-9]", with: "", options: .regularExpression)
        for index in 0 ..< pattern.count {
            guard index < pureNumber.count else { return pureNumber }
            let stringIndex = String.Index(encodedOffset: index)
            let patternCharacter = pattern[stringIndex]
            guard patternCharacter != replacmentCharacter else { continue }
            pureNumber.insert(patternCharacter, at: stringIndex)
        }
        return pureNumber
    }
    
    func addCharacterSpacing(kernValue: Double = 1.15) -> NSMutableAttributedString {
        let attributedString = NSMutableAttributedString(string: self)
        if self.count > 0 {
            attributedString.addAttribute(NSAttributedString.Key.kern, value: kernValue, range: NSRange(location: 0, length: attributedString.length - 1))
        }
        return attributedString
    }
}

/*
 Will generate radom string based on length
 */
public func randomString(length: Int) -> String {
    
    let letters : NSString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    let len = UInt32(letters.length)
    var randomString = ""
    for _ in 0 ..< length {
        let rand = arc4random_uniform(len)
        var nextChar = letters.character(at: Int(rand))
        randomString += NSString(characters: &nextChar, length: 1) as String
    }
    return randomString
}

public func randomCode(length: Int) -> String {
    
    let letters : NSString = "0123456789"
    let len = UInt32(letters.length)
    var randomString = ""
    for _ in 0 ..< length {
        let rand = arc4random_uniform(len)
        var nextChar = letters.character(at: Int(rand))
        randomString += NSString(characters: &nextChar, length: 1) as String
    }
    return randomString
}

public func convertToDictionary(text: String) -> [String: Any]? {
    if let data = text.data(using: .utf8) {
        do {
            return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
        } catch {
            print(error.localizedDescription)
        }
    }
    return nil
}

public func convertToArray(text: String) -> [[String: Any]]? {
    if let data = text.data(using: .utf8) {
        do {
            return try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]]
        } catch {
            print(error.localizedDescription)
        }
    }
    return nil
}


extension NSAttributedString {
    var trailingNewlineChopped: NSAttributedString {
        guard self.length > 0 else {
            return self
        }
        let lastCharRange = NSMakeRange(self.length - 1, 1)
        let lastChar = self.attributedSubstring(from: lastCharRange).string
        guard lastChar == "\n" else {
            return self
        }
        let mutableCopy = NSMutableAttributedString(attributedString: self)
        mutableCopy.deleteCharacters(in: lastCharRange)
        return mutableCopy
    }
}
