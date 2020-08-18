//
//  Enumerations.swift
//  AppStoreSearch
//
//  Created by 이정환 on 2020/08/14.
//  Copyright © 2020 RYAN. All rights reserved.
//

import Foundation

//MARK: request parameters
enum ParameterKeys: String {
    case term = "term"
    case country = "country"
    case media = "media"
    case entity = "entity"
    case attribute = "attribute"
    case callback = "callback"
    case limit = "limit"
    case lang = "lang"
    case version = "version"
    case explicit = "explicit"
}

enum ParameterValues {
    typealias Media = Entities
    typealias Attributes = Entities
    enum Entities: String {
        case movie = "movie"
        case podcast = "podcast"
        case music = "music"
        case musicVideo = "musicVideo"
        case audiobook = "audiobook"
        case shortFilm = "shortFilm"
        case tvShow = "tvShow"
        case software = "software"
        case ebook = "ebook"
        case all = "all"
    }
}

enum HttpMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
    case patch = "PATCH"
}

enum ResponseStatus: String {
    case success
    case failure
}

enum StoryboardName: String {
    case launchScreen = "LaunchScreen"
    case main = "Main"
}

enum VCIdentifier: String {
    case gateway = "GatewayViewController"
    case searchMain = "SearchMainViewController"
}
