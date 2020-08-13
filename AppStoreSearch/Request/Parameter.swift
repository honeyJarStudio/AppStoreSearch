//
//  Parameters.swift
//  AppStoreSearch
//
//  Created by 이정환 on 2020/08/13.
//  Copyright © 2020 RYAN. All rights reserved.
//

import Foundation

class Parameter {
    
    //MARK: Variables
    private var key: String?
    private var value: Any?
    
    //MARK: Functions
    func getKey() -> String? {
        return self.key
    }
    
    func getValue() -> Any? {
        return self.value
    }
    
    func set(key: String, value: Any) -> Parameter {
        self.key = key
        self.value = value
        return self
    }
    
    func asKeyWord(text: String) -> Parameter {
        return self.set(key: ParameterKeys.term.rawValue, value: text)
    }
    
    func asCountry(locale: Locale) -> Parameter {
        var code: String = "KR"
        if let value = locale.regionCode {
            code = value
        } else if let defaultValue = Locale.current.regionCode {
            code = defaultValue
        }
        return self.set(key: ParameterKeys.lang.rawValue, value: code.uppercased())
    }
    
    func asMedia(value: ParameterValues.EntitiesAndAttributes) -> Parameter {
        return self.set(key: ParameterKeys.media.rawValue, value: value.rawValue)
    }
    
    func asEntity(value: ParameterValues.EntitiesAndAttributes) -> Parameter {
        return self.set(key: ParameterKeys.entity.rawValue, value: value.rawValue)
    }
    
    func asAttribute(value: ParameterValues.EntitiesAndAttributes) -> Parameter {
        return self.set(key: ParameterKeys.attribute.rawValue, value: value.rawValue)
    }
    
    func asCallback(text: String) -> Parameter {
        return self.set(key: ParameterKeys.callback.rawValue, value: text)
    }
    
    func asLimit(value: Int) -> Parameter {
        var finalValue = value
        if value < 1 {
            finalValue = 1
        } else if value > 200 {
            finalValue = 200
        }
        return self.set(key: ParameterKeys.limit.rawValue, value: finalValue)
    }
    
    func asLang(locale: Locale) -> Parameter {
        var code: String = "ko_kr"
        if let value = locale.languageCode {
            code = value
        } else if let defaultValue = Locale.current.languageCode {
            code = defaultValue
        }
        return self.set(key: ParameterKeys.lang.rawValue, value: code.lowercased())
    }
    
    func asVersion(value: Int) -> Parameter {
        return self.set(key: ParameterKeys.version.rawValue, value: value)
    }
    
    func asExplicit(_ flag: Bool) -> Parameter {
        return self.set(key: ParameterKeys.explicit.rawValue, value: flag ? "Yes" : "No")
    }
}

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

class ParameterValues {
    enum EntitiesAndAttributes: String {
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
