//
//  UserDetailModel.swift
//  DemoTwitter
//
//  Created by iMac on 27/08/21.
//

import Foundation
struct UserDetailModel: Codable {

    let id: Int?
    let idStr: String?
    let name: String?
    let screenName: String?
    let location: String?
    let profileLocation: ProfileLocation?
    let description: String?
    let url: String?
    let entities: Entities?
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
    let status: Status?
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
    let translatorType: String?
    let withheldInCountries: [String]?

    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case idStr = "id_str"
        case name = "name"
        case screenName = "screen_name"
        case location = "location"
        case profileLocation = "profile_location"
        case description = "description"
        case url = "url"
        case entities = "entities"
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
        case status = "status"
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
        case translatorType = "translator_type"
        case withheldInCountries = "withheld_in_countries"
    }

    init(from decoder: Decoder) throws {
        let values = try? decoder.container(keyedBy: CodingKeys.self)
        id = try values?.decodeIfPresent(Int.self, forKey: .id)
        idStr = try values?.decodeIfPresent(String.self, forKey: .idStr)
        name = try values?.decodeIfPresent(String.self, forKey: .name)
        screenName = try values?.decodeIfPresent(String.self, forKey: .screenName)
        location = try values?.decodeIfPresent(String.self, forKey: .location)
        profileLocation = try values?.decodeIfPresent(ProfileLocation.self, forKey: .profileLocation)
        description = try values?.decodeIfPresent(String.self, forKey: .description)
        url = try values?.decodeIfPresent(String.self, forKey: .url)
        entities = try values?.decodeIfPresent(Entities.self, forKey: .entities)
        protected = try values?.decodeIfPresent(Bool.self, forKey: .protected)
        followersCount = try values?.decodeIfPresent(Int.self, forKey: .followersCount)
        friendsCount = try values?.decodeIfPresent(Int.self, forKey: .friendsCount)
        listedCount = try values?.decodeIfPresent(Int.self, forKey: .listedCount)
        createdAt = try values?.decodeIfPresent(String.self, forKey: .createdAt)
        favouritesCount = try values?.decodeIfPresent(Int.self, forKey: .favouritesCount)
        utcOffset = try values?.decodeIfPresent(String.self, forKey: .utcOffset)
        timeZone = try values?.decodeIfPresent(String.self, forKey: .timeZone)
        geoEnabled = try values?.decodeIfPresent(Bool.self, forKey: .geoEnabled)
        verified = try values?.decodeIfPresent(Bool.self, forKey: .verified)
        statusesCount = try values?.decodeIfPresent(Int.self, forKey: .statusesCount)
        lang = try values?.decodeIfPresent(String.self, forKey: .lang)
        status = try values?.decodeIfPresent(Status.self, forKey: .status)
        contributorsEnabled = try values?.decodeIfPresent(Bool.self, forKey: .contributorsEnabled)
        isTranslator = try values?.decodeIfPresent(Bool.self, forKey: .isTranslator)
        isTranslationEnabled = try values?.decodeIfPresent(Bool.self, forKey: .isTranslationEnabled)
        profileBackgroundColor = try values?.decodeIfPresent(String.self, forKey: .profileBackgroundColor)
        profileBackgroundImageUrl = try values?.decodeIfPresent(String.self, forKey: .profileBackgroundImageUrl)
        profileBackgroundImageUrlHttps = try values?.decodeIfPresent(String.self, forKey: .profileBackgroundImageUrlHttps)
        profileBackgroundTile = try values?.decodeIfPresent(Bool.self, forKey: .profileBackgroundTile)
        profileImageUrl = try values?.decodeIfPresent(String.self, forKey: .profileImageUrl)
        profileImageUrlHttps = try values?.decodeIfPresent(String.self, forKey: .profileImageUrlHttps)
        profileBannerUrl = try values?.decodeIfPresent(String.self, forKey: .profileBannerUrl)
        profileLinkColor = try values?.decodeIfPresent(String.self, forKey: .profileLinkColor)
        profileSidebarBorderColor = try values?.decodeIfPresent(String.self, forKey: .profileSidebarBorderColor)
        profileSidebarFillColor = try values?.decodeIfPresent(String.self, forKey: .profileSidebarFillColor)
        profileTextColor = try values?.decodeIfPresent(String.self, forKey: .profileTextColor)
        profileUseBackgroundImage = try values?.decodeIfPresent(Bool.self, forKey: .profileUseBackgroundImage)
        hasExtendedProfile = try values?.decodeIfPresent(Bool.self, forKey: .hasExtendedProfile)
        defaultProfile = try values?.decodeIfPresent(Bool.self, forKey: .defaultProfile)
        defaultProfileImage = try values?.decodeIfPresent(Bool.self, forKey: .defaultProfileImage)
        following = try values?.decodeIfPresent(String.self, forKey: .following)
        followRequestSent = try values?.decodeIfPresent(String.self, forKey: .followRequestSent)
        notifications = try values?.decodeIfPresent(String.self, forKey: .notifications)
        translatorType = try values?.decodeIfPresent(String.self, forKey: .translatorType)
        withheldInCountries = [] // TODO: Add code for decoding `withheldInCountries`, It was empty at the time of model creation.
    }

}

struct ProfileLocation: Codable {

    let id: String?
    let url: String?
    let placeType: String?
    let name: String?
    let fullName: String?
    let countryCode: String?
    let country: String?
    let attributes: Attributes?

    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case url = "url"
        case placeType = "place_type"
        case name = "name"
        case fullName = "full_name"
        case countryCode = "country_code"
        case country = "country"
        case attributes = "attributes"
    }

    init(from decoder: Decoder) throws {
        let values = try? decoder.container(keyedBy: CodingKeys.self)
        id = try values?.decodeIfPresent(String.self, forKey: .id)
        url = try values?.decodeIfPresent(String.self, forKey: .url)
        placeType = try values?.decodeIfPresent(String.self, forKey: .placeType)
        name = try values?.decodeIfPresent(String.self, forKey: .name)
        fullName = try values?.decodeIfPresent(String.self, forKey: .fullName)
        countryCode = try values?.decodeIfPresent(String.self, forKey: .countryCode)
        country = try values?.decodeIfPresent(String.self, forKey: .country)
        attributes = try values?.decodeIfPresent(Attributes.self, forKey: .attributes)
    }

}

struct Attributes: Codable {

}

struct Entities: Codable {

    let url: Url?
    let description: Description?

    private enum CodingKeys: String, CodingKey {
        case url = "url"
        case description = "description"
    }

    init(from decoder: Decoder) throws {
        let values = try? decoder.container(keyedBy: CodingKeys.self)
        url = try values?.decodeIfPresent(Url.self, forKey: .url)
        description = try values?.decodeIfPresent(Description.self, forKey: .description)
    }

}

struct Url: Codable {

    let urls: [Urls]?

    private enum CodingKeys: String, CodingKey {
        case urls = "urls"
    }

    init(from decoder: Decoder) throws {
        let values = try? decoder.container(keyedBy: CodingKeys.self)
        urls = try values?.decodeIfPresent([Urls].self, forKey: .urls)
    }

}

struct Urls: Codable {

    let url: String?
    let expandedUrl: String?
    let displayUrl: String?
    let indices: [Int]?

    private enum CodingKeys: String, CodingKey {
        case url = "url"
        case expandedUrl = "expanded_url"
        case displayUrl = "display_url"
        case indices = "indices"
    }

    init(from decoder: Decoder) throws {
        let values = try? decoder.container(keyedBy: CodingKeys.self)
        url = try values?.decodeIfPresent(String.self, forKey: .url)
        expandedUrl = try values?.decodeIfPresent(String.self, forKey: .expandedUrl)
        displayUrl = try values?.decodeIfPresent(String.self, forKey: .displayUrl)
        indices = try values?.decodeIfPresent([Int].self, forKey: .indices)
    }

}

struct Description: Codable {

}

struct Status: Codable {

    let createdAt: String?
    let id: Int?
    let idStr: String?
    let text: String?
    let truncated: Bool?
    let entities: Entities?
    let source: String?
    let inReplyToStatusId: Int?
    let inReplyToStatusIdStr: String?
    let inReplyToUserId: Int?
    let inReplyToUserIdStr: String?
    let inReplyToScreenName: String?
    let isQuoteStatus: Bool?
    let retweetCount: Int?
    let favoriteCount: Int?
    let favorited: Bool?
    let retweeted: Bool?
    let lang: String?

    private enum CodingKeys: String, CodingKey {
        case createdAt = "created_at"
        case id = "id"
        case idStr = "id_str"
        case text = "text"
        case truncated = "truncated"
        case entities = "entities"
        case source = "source"
        case inReplyToStatusId = "in_reply_to_status_id"
        case inReplyToStatusIdStr = "in_reply_to_status_id_str"
        case inReplyToUserId = "in_reply_to_user_id"
        case inReplyToUserIdStr = "in_reply_to_user_id_str"
        case inReplyToScreenName = "in_reply_to_screen_name"
        case isQuoteStatus = "is_quote_status"
        case retweetCount = "retweet_count"
        case favoriteCount = "favorite_count"
        case favorited = "favorited"
        case retweeted = "retweeted"
        case lang = "lang"
    }

    init(from decoder: Decoder) throws {
        let values = try? decoder.container(keyedBy: CodingKeys.self)
        createdAt = try values?.decodeIfPresent(String.self, forKey: .createdAt)
        id = try values?.decodeIfPresent(Int.self, forKey: .id)
        idStr = try values?.decodeIfPresent(String.self, forKey: .idStr)
        text = try values?.decodeIfPresent(String.self, forKey: .text)
        truncated = try values?.decodeIfPresent(Bool.self, forKey: .truncated)
        entities = try values?.decodeIfPresent(Entities.self, forKey: .entities)
        source = try values?.decodeIfPresent(String.self, forKey: .source)
        inReplyToStatusId = try values?.decodeIfPresent(Int.self, forKey: .inReplyToStatusId)
        inReplyToStatusIdStr = try values?.decodeIfPresent(String.self, forKey: .inReplyToStatusIdStr)
        inReplyToUserId = try values?.decodeIfPresent(Int.self, forKey: .inReplyToUserId)
        inReplyToUserIdStr = try values?.decodeIfPresent(String.self, forKey: .inReplyToUserIdStr)
        inReplyToScreenName = try values?.decodeIfPresent(String.self, forKey: .inReplyToScreenName)
        isQuoteStatus = try values?.decodeIfPresent(Bool.self, forKey: .isQuoteStatus)
        retweetCount = try values?.decodeIfPresent(Int.self, forKey: .retweetCount)
        favoriteCount = try values?.decodeIfPresent(Int.self, forKey: .favoriteCount)
        favorited = try values?.decodeIfPresent(Bool.self, forKey: .favorited)
        retweeted = try values?.decodeIfPresent(Bool.self, forKey: .retweeted)
        lang = try values?.decodeIfPresent(String.self, forKey: .lang)
    }

}

struct UserMentions: Codable {

    let screenName: String?
    let name: String?
    let id: Int?
    let idStr: String?
    let indices: [Int]?

    private enum CodingKeys: String, CodingKey {
        case screenName = "screen_name"
        case name = "name"
        case id = "id"
        case idStr = "id_str"
        case indices = "indices"
    }

    init(from decoder: Decoder) throws {
        let values = try? decoder.container(keyedBy: CodingKeys.self)
        screenName = try values?.decodeIfPresent(String.self, forKey: .screenName)
        name = try values?.decodeIfPresent(String.self, forKey: .name)
        id = try values?.decodeIfPresent(Int.self, forKey: .id)
        idStr = try values?.decodeIfPresent(String.self, forKey: .idStr)
        indices = try values?.decodeIfPresent([Int].self, forKey: .indices)
    }
}
