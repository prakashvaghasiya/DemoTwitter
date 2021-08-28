//
//  ApiHandler.swift
//  Fix Food App
//
//  Created by iMac on 11/07/21.
//

import UIKit
import Alamofire

protocol apiHandleDelegate {
    func progress(progress : Int, complete: Bool)
}

public func ShowNetworkIndicator(xx :Bool)
{
    UIApplication.shared.isNetworkActivityIndicatorVisible = xx
}
class HttpRequestManager {
    static let shared = HttpRequestManager()
    func getMethodCall(url: String, parameter: [String: Any], responseData:@escaping (_ data: Data?, _ error: NSError?, _ message: String?) -> ()) {
        ShowNetworkIndicator(xx: true)
        var request = URLRequest(url: URL(string: url)!,timeoutInterval: Double.infinity)
        for par in parameter {
            request.addValue("\(par.value)", forHTTPHeaderField: par.key)
        }
        request.addValue("guest_id=v1%3A162997554563551529; personalization_id=\"v1_F0S9raETLRZPo23OZSFf8g==\"", forHTTPHeaderField: "Cookie")
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            ShowNetworkIndicator(xx: false)
            if error == nil {
                
                responseData(data, error as NSError?, "Something went wrong")
            } else {
                responseData(nil, error as NSError?, "Something went wrong")
            }
        }
        task.resume()
    }
    
    func postMethodCall(url: String, parameter: [String: Any], responseData:@escaping (_ data: Data?, _ error: NSError?, _ message: String?) -> ()) {
        ShowNetworkIndicator(xx: true)
        var request = URLRequest(url: URL(string: url)!,timeoutInterval: Double.infinity)
        for par in parameter {
            request.addValue("\(par.value)", forHTTPHeaderField: par.key)
        }
        request.addValue("guest_id=v1%3A162997554563551529; personalization_id=\"v1_F0S9raETLRZPo23OZSFf8g==\"", forHTTPHeaderField: "Cookie")
        request.httpMethod = "POST"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            ShowNetworkIndicator(xx: false)
            if error == nil {
                
                responseData(data, error as NSError?, "Something went wrong")
            } else {
                responseData(nil, error as NSError?, "Something went wrong")
            }
        }
        task.resume()
    }
}
