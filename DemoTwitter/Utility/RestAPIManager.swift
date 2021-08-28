import UIKit
//import Alamofire
//import AFNetworking

//let baseApiURL = "http://fabcoders.com/brunchnew/api/"
//let baseApiURLImg = "http://fabcoders.com/brunchnew"
extension UIViewController {
    func HttpRequest_POST_Auth(method: String,
                               param: NSDictionary,
                               success: @escaping (_ responseObject: NSDictionary) -> Void,
                               failure: @escaping (_ error: Error?) -> Void) {
        
        //let userinfo = self.strTodic(string: UserDefaults.string(forKey: "userinfo")!) as NSDictionary
        // let token = userinfo.string(forKey: "token")!
    

        
        let manager = AFHTTPSessionManager()
//        manager.requestSerializer.setValue("XMLHttpRequest", forHTTPHeaderField: "X-Requested-With")
//        manager.requestSerializer.setValue("Bearer \(UserDefaults.access_token)", forHTTPHeaderField: "Authorization")
        
        let url = method
        manager.post(url, parameters: param, headers: [:], progress: { (progress) in
        }, success: { (task: URLSessionDataTask, responseObject: Any?) in
            activityIndicatorView.stopAnimating()
            KVNProgress.dismiss()
            if let jsonResult = responseObject as? NSDictionary {
                print(jsonResult)
                //                if jsonResult.bool(forKey: "flag") {
                success(jsonResult)
                //                } else if method == "index.php/oauth/token" {
                //                    KVNProgress.dismiss()
                //                    success(jsonResult)
                //                } else if jsonResult.string(forKey: "message") == "You are not authorized to access this" {
                //                    KVNProgress.dismiss()
                //                    self.gotoLogin()
                //                } else {
                //                    KVNProgress.showError(withStatus: jsonResult.string(forKey: "message"))
                //                }
            }else{
                KVNProgress.showError(withStatus: "Responce can't convert in Dictionary")
                //print("Responce can't convert in Dictionary")
            }
        }) { (task: URLSessionDataTask?, error: Error) in
            activityIndicatorView.stopAnimating()
            KVNProgress.dismiss()
//            print("Error: \(String(describing: error.localizedDescription))")
            if method == "oauth/token" || method == "api/user/signup" {
                if error.localizedDescription == "Request failed: unauthorized (401)" || error.localizedDescription == "Request failed: client error (422)" {
                    
                } else {
                    KVNProgress.showError(withStatus: "\(String(describing: error.localizedDescription))")
                }
            } else {
                if error.localizedDescription == "Request failed: unauthorized (401)" {
                    KVNProgress.showError(withStatus: "\(String(describing: error.localizedDescription))") {
//                        self.logoutApp()
                    }
                } else{
                    KVNProgress.showError(withStatus: "\(String(describing: error.localizedDescription))")

                }
            }
            
            //
            failure(error)
        }
    }

//    func HttpRequest_POST_Auth(method: String,
//                               param: NSDictionary,
//                               success: @escaping (_ responseObject: NSDictionary) -> Void,
//                               failure: @escaping (_ error: Error?) -> Void) {
////        let header = HTTPHeader.authorization(username: "BBuser", password: "BX20@v")
//        print(param)
//        if !isInternetAvailable() {
//            KVNProgress.showError(withStatus: "No Internet Connection")
//            activityIndicatorView.stopAnimating()
//            return
//        }
//        AF.request(URL.init(string: method)!, method: .post, parameters: param as? Parameters, encoding: JSONEncoding.default, headers: [:]).responseJSON { (response) in
//            activityIndicatorView.stopAnimating()
//            KVNProgress.dismiss()
//            switch response.result {
//            case .success(_):
//                if let json = response.value
//                {
//                    if let jsonResult = json as? NSDictionary {
//                        print(jsonResult)
//                        if jsonResult.bool(forKey: "status") {
//                            success(jsonResult)
//                        }else {
//                            KVNProgress.showError(withStatus: jsonResult.string(forKey: "message"))
//                        }
//                    }else{
//                        KVNProgress.showError(withStatus: "Responce can't convert in Dictionary")
//                    }
//                }
//                break
//            case .failure(let error):
//                KVNProgress.showError(withStatus: "\(String(describing: error.localizedDescription))")
//                failure(error)
//                break
//            }
//        }
//    }
}
