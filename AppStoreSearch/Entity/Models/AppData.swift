//
//  AppPreviewData.swift
//  AppStoreSearch
//
//  Created by 이정환 on 2020/08/13.
//  Copyright © 2020 RYAN. All rights reserved.
//

import Foundation

struct AppSearchResult: BaseObject {
    var resultCount: Int?
    var results: [AppData]?
}

struct AppData: BaseObject {
    var artistViewUrl: String?
    var artworkUrl60: String?
    var artworkUrl100: String?
    var artworkUrl512: String?
    var appletvScreenshotUrls: [String]?
    var screenshotUrls: [String]?
    var ipadScreenshotUrls: [String]?
    var isGameCenterEnabled: Bool?
    var advisories: [String]?
    var supportedDevices: [String]? //"iPhone11-iPhone11", "iPad878-iPad878", "iPadProSecondGen-iPadProSecondGen"
    var features: [String]?
    var kind: String? // "software"
    var trackCensoredName: String? // "카카오뱅크 - 같지만 다른 은행",
    var trackViewUrl: String?
    var contentAdvisoryRating: String? // "4+",
    var fileSizeBytes: String? // "420410368"
    var averageUserRating: Float? // 3.58667
    var languageCodesISO2A: [String]? // "KO", "EN"
    var sellerUrl: String?
    var averageUserRatingForCurrentVersion: Float? // 3.58667
    var userRatingCountForCurrentVersion: Int? // 75
    var trackContentRating: String? // 4+
    var trackId: Int? // 1258016944
    var trackName: String? // "카카오뱅크 - 같지만 다른 은행"
    var releaseDate: String? // yyyy-MM-ddTHH:mm:ssZ
    var genreIds: [String]? // ["6015"]
    var formattedPrice: String? // "Free"
    var primaryGenreName: String? // "Finance"
    var isVppDeviceBasedLicensingEnabled: Bool?
    var currentVersionReleaseDate: String? // yyyy-MM-ddTHH:mm:ssZ
    var releaseNotes: String? // "2.1.3\n● 안정성 개선 및 버그 수정 ..."
    var primaryGenreId: Int? //6015
    var sellerName: String? // "KakaoBank Corp."
    var minimumOsVersion: String? // "9.0"
    var currency: String? // "USD", "KRW"
    var artistId: Int? // 1258016943
    var artistName: String? // "KakaoBank Corp."
    var genres: [String]? // ["Finance"]
    var price: Float?
    var description: String? // "일상에서 더 쉽게, 더 자주 만나는 금융혁신 ..."
    var bundleId: String? // "com.kakaobank.channel"
    var version: String? // "2.1.3"
    var wrapperType: String? // "software"
    var userRatingCount: Int? // 75
}
