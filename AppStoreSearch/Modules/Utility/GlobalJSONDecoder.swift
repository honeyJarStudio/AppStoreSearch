//
//  GlobalJSONDecoder.swift
//  AppStoreSearch
//
//  Created by 이정환 on 2020/08/14.
//  Copyright © 2020 RYAN. All rights reserved.
//

import Foundation

class GlobalJSONDecoder {
    //MARK: Variables
    private static var decoder: JSONDecoder!
    
    //MARK: Functions
    static func getDecoder() -> JSONDecoder {
        if self.decoder == nil {
            self.decoder = JSONDecoder()
            self.decoder?.dateDecodingStrategy = .iso8601
        }
        return self.decoder
    }
}
