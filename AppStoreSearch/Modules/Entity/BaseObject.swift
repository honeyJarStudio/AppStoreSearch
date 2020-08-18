//
//  BaseObject.swift
//  AppStoreSearch
//
//  Created by 이정환 on 2020/08/13.
//  Copyright © 2020 RYAN. All rights reserved.
//

import Foundation

protocol BaseObject: Codable {
    static func map<T: BaseObject>(json: String) -> T?
}

extension BaseObject {
    
    static func map<T: BaseObject>(json: String) -> T? {
        if let data = json.data(using: .utf8) {
            return self.map(data: data)
        }
        return nil
    }
    
    static func map<T: BaseObject>(data: Data) -> T? {
        if let result = try? GlobalJSONDecoder.getDecoder().decode(T.self, from: data) {
            return result as T
        }
        return nil
    }
}
