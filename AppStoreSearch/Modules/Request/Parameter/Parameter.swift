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
    func exportParamString() -> String? {
        guard let key = self.key, let value = self.value else {
            return nil
        }
        return "\(key)=\(value)"
    }
    
    func getKey() -> String? {
        return self.key
    }
    
    func getValue() -> Any? {
        return self.value
    }
    
    func set(key: String, value: Any) {
        self.key = key
        self.value = value
    }
    
    func asTerm(text: String) -> Parameter {
        guard let converted = text.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {
            return self
        }
        self.set(key: ParameterKeys.term.rawValue, value: converted)
        return self
    }
    
    func asCountry(locale: Locale) -> Parameter {
        var code: String = "KR"
        if let value = locale.regionCode {
            code = value
        } else if let defaultValue = Locale.current.regionCode {
            code = defaultValue
        }
        self.set(key: ParameterKeys.lang.rawValue, value: code.uppercased())
        return self
    }
    
    func asMedia(value: ParameterValues.Media) -> Parameter {
        self.set(key: ParameterKeys.media.rawValue, value: value.rawValue)
        return self
    }
    
    func asEntity(value: ParameterValues.Entities) -> Parameter {
        self.set(key: ParameterKeys.entity.rawValue, value: value.rawValue)
        return self
    }
    
    func asAttribute(value: ParameterValues.Attributes) -> Parameter {
        self.set(key: ParameterKeys.attribute.rawValue, value: value.rawValue)
        return self
    }
    
    func asCallback(url: String) -> Parameter {
        self.set(key: ParameterKeys.callback.rawValue, value: url)
        return self
    }
    
    func asLimit(value: Int) -> Parameter {
        var finalValue = value
        if value < 1 {
            finalValue = 1
        } else if value > 200 {
            finalValue = 200
        }
        self.set(key: ParameterKeys.limit.rawValue, value: finalValue)
        return self
    }
    
    func asLang(locale: Locale) -> Parameter {
        var code: String = "ko_kr"
        if let value = locale.languageCode {
            code = value
        } else if let defaultValue = Locale.current.languageCode {
            code = defaultValue
        }
        self.set(key: ParameterKeys.lang.rawValue, value: code.lowercased())
        return self
    }
    
    func asVersion(value: Int) -> Parameter {
        self.set(key: ParameterKeys.version.rawValue, value: value)
        return self
    }
    
    func asExplicit(_ flag: Bool) -> Parameter {
        self.set(key: ParameterKeys.explicit.rawValue, value: flag ? "Yes" : "No")
        return self
    }
}
