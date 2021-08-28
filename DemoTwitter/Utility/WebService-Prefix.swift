//
//  WebService-Prefix.swift
//
//  Created by Prakash Vaghasiya on 16/02/21.
//  Copyright © 2021 Prakash. All rights reserved.
//

import Foundation
struct APIErrorLogConstants {
    static let NoInternet = "K2C requires a network connection to work properly.  Please check your WiFi or internet connection."
    static let SomethingWrong = "Something went wrong. Please try after some time."
    static let NoResult = "No results found!"
    static let ServerDown = "AppName server is not responding.Please try after some time"
}

struct APISuccessLogConstants {
    static let ResendOTP = "Resend OTP Successfully."
    static let BookService = "Booked service successfully."
    static let AddFeedback = "Added feedback successfully."
}

struct APIServerConstants {
    static let BaseURL = "https://api.twitter.com/1.1/"
}

struct APIConstants {
    static let FollowersList = "\(APIServerConstants.BaseURL)followers/list.json?screen_name="
    static let FriendList = "\(APIServerConstants.BaseURL)friends/list.json?screen_name="
    static let UserDetail = "\(APIServerConstants.BaseURL)users/show.json?screen_name="
    static let AccessToken = "https://api.twitter.com/oauth2/token"
}
