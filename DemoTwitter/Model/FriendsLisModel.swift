//
//  FriendsLisModel.swift
//  DemoTwitter
//
//  Created by iMac on 27/08/21.
//

import Foundation
struct FriendsLisModel: Codable {

    let users: [Users]?
    let nextCursor: Int?
    let nextCursorStr: String?
    let previousCursor: Int?
    let previousCursorStr: String?

    private enum CodingKeys: String, CodingKey {
        case users = "users"
        case nextCursor = "next_cursor"
        case nextCursorStr = "next_cursor_str"
        case previousCursor = "previous_cursor"
        case previousCursorStr = "previous_cursor_str"
    }

    init(from decoder: Decoder) throws {
        let values = try? decoder.container(keyedBy: CodingKeys.self)
        users = try values?.decodeIfPresent([Users].self, forKey: .users)
        nextCursor = try values?.decodeIfPresent(Int.self, forKey: .nextCursor)
        nextCursorStr = try values?.decodeIfPresent(String.self, forKey: .nextCursorStr)
        previousCursor = try values?.decodeIfPresent(Int.self, forKey: .previousCursor)
        previousCursorStr = try values?.decodeIfPresent(String.self, forKey: .previousCursorStr)
    }

}

struct Users: Codable {

    let id: Int?
    let idStr: String?
    let name: String?
    let screenName: String?
    let location: String?
    let url: String?
    let description: String?
    let protected: Bool?
    let followersCount: Int?
    let friendsCount: Int?
    let listedCount: Int?
    let createdAt: String?
    let favouritesCount: Int?
    let utcOffset: String?
    let timeZone: String?
    let geoEnabled: Bool?
    let verified: Bool?
    let statusesCount: Int?
    let lang: String?
    let contributorsEnabled: Bool?
    let isTranslator: Bool?
    let isTranslationEnabled: Bool?
    let profileBackgroundColor: String?
    let profileBackgroundImageUrl: String?
    let profileBackgroundImageUrlHttps: String?
    let profileBackgroundTile: Bool?
    let profileImageUrl: String?
    let profileImageUrlHttps: String?
    let profileBannerUrl: String?
    let profileLinkColor: String?
    let profileSidebarBorderColor: String?
    let profileSidebarFillColor: String?
    let profileTextColor: String?
    let profileUseBackgroundImage: Bool?
    let hasExtendedProfile: Bool?
    let defaultProfile: Bool?
    let defaultProfileImage: Bool?
    let following: String?
    let followRequestSent: String?
    let notifications: String?
    let muting: String?
    let blocking: String?
    let blockedBy: String?
    let translatorType: String?

    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case idStr = "id_str"
        case name = "name"
        case screenName = "screen_name"
        case location = "location"
        case url = "url"
        case description = "description"
        case protected = "protected"
        case followersCount = "followers_count"
        case friendsCount = "friends_count"
        case listedCount = "listed_count"
        case createdAt = "created_at"
        case favouritesCount = "favourites_count"
        case utcOffset = "utc_offset"
        case timeZone = "time_zone"
        case geoEnabled = "geo_enabled"
        case verified = "verified"
        case statusesCount = "statuses_count"
        case lang = "lang"
        case contributorsEnabled = "contributors_enabled"
        case isTranslator = "is_translator"
        case isTranslationEnabled = "is_translation_enabled"
        case profileBackgroundColor = "profile_background_color"
        case profileBackgroundImageUrl = "profile_background_image_url"
        case profileBackgroundImageUrlHttps = "profile_background_image_url_https"
        case profileBackgroundTile = "profile_background_tile"
        case profileImageUrl = "profile_image_url"
        case profileImageUrlHttps = "profile_image_url_https"
        case profileBannerUrl = "profile_banner_url"
        case profileLinkColor = "profile_link_color"
        case profileSidebarBorderColor = "profile_sidebar_border_color"
        case profileSidebarFillColor = "profile_sidebar_fill_color"
        case profileTextColor = "profile_text_color"
        case profileUseBackgroundImage = "profile_use_background_image"
        case hasExtendedProfile = "has_extended_profile"
        case defaultProfile = "default_profile"
        case defaultProfileImage = "default_profile_image"
        case following = "following"
        case followRequestSent = "follow_request_sent"
        case notifications = "notifications"
        case muting = "muting"
        case blocking = "blocking"
        case blockedBy = "blocked_by"
        case translatorType = "translator_type"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        idStr = try values.decodeIfPresent(String.self, forKey: .idStr)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        screenName = try values.decodeIfPresent(String.self, forKey: .screenName)
        location = try values.decodeIfPresent(String.self, forKey: .location)
        url = try values.decodeIfPresent(String.self, forKey: .url)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        protected = try values.decodeIfPresent(Bool.self, forKey: .protected)
        followersCount = try values.decodeIfPresent(Int.self, forKey: .followersCount)
        friendsCount = try values.decodeIfPresent(Int.self, forKey: .friendsCount)
        listedCount = try values.decodeIfPresent(Int.self, forKey: .listedCount)
        createdAt = try values.decodeIfPresent(String.self, forKey: .createdAt)
        favouritesCount = try values.decodeIfPresent(Int.self, forKey: .favouritesCount)
        utcOffset = try values.decodeIfPresent(String.self, forKey: .utcOffset)
        timeZone = try values.decodeIfPresent(String.self, forKey: .timeZone)
        geoEnabled = try values.decodeIfPresent(Bool.self, forKey: .geoEnabled)
        verified = try values.decodeIfPresent(Bool.self, forKey: .verified)
        statusesCount = try values.decodeIfPresent(Int.self, forKey: .statusesCount)
        lang = try values.decodeIfPresent(String.self, forKey: .lang)
        contributorsEnabled = try values.decodeIfPresent(Bool.self, forKey: .contributorsEnabled)
        isTranslator = try values.decodeIfPresent(Bool.self, forKey: .isTranslator)
        isTranslationEnabled = try values.decodeIfPresent(Bool.self, forKey: .isTranslationEnabled)
        profileBackgroundColor = try values.decodeIfPresent(String.self, forKey: .profileBackgroundColor)
        profileBackgroundImageUrl = try values.decodeIfPresent(String.self, forKey: .profileBackgroundImageUrl)
        profileBackgroundImageUrlHttps = try values.decodeIfPresent(String.self, forKey: .profileBackgroundImageUrlHttps)
        profileBackgroundTile = try values.decodeIfPresent(Bool.self, forKey: .profileBackgroundTile)
        profileImageUrl = try values.decodeIfPresent(String.self, forKey: .profileImageUrl)
        profileImageUrlHttps = try values.decodeIfPresent(String.self, forKey: .profileImageUrlHttps)
        profileBannerUrl = try values.decodeIfPresent(String.self, forKey: .profileBannerUrl)
        profileLinkColor = try values.decodeIfPresent(String.self, forKey: .profileLinkColor)
        profileSidebarBorderColor = try values.decodeIfPresent(String.self, forKey: .profileSidebarBorderColor)
        profileSidebarFillColor = try values.decodeIfPresent(String.self, forKey: .profileSidebarFillColor)
        profileTextColor = try values.decodeIfPresent(String.self, forKey: .profileTextColor)
        profileUseBackgroundImage = try values.decodeIfPresent(Bool.self, forKey: .profileUseBackgroundImage)
        hasExtendedProfile = try values.decodeIfPresent(Bool.self, forKey: .hasExtendedProfile)
        defaultProfile = try values.decodeIfPresent(Bool.self, forKey: .defaultProfile)
        defaultProfileImage = try values.decodeIfPresent(Bool.self, forKey: .defaultProfileImage)
        following = try values.decodeIfPresent(String.self, forKey: .following)
        followRequestSent = try values.decodeIfPresent(String.self, forKey: .followRequestSent)
        notifications = try values.decodeIfPresent(String.self, forKey: .notifications)
        muting = try values.decodeIfPresent(String.self, forKey: .muting)
        blocking = try values.decodeIfPresent(String.self, forKey: .blocking)
        blockedBy = try values.decodeIfPresent(String.self, forKey: .blockedBy)
        translatorType = try values.decodeIfPresent(String.self, forKey: .translatorType)
    }

}
