//
//  AppStoreRequest.swift
//  AppStoreSearch
//
//  Created by 이정환 on 2020/08/14.
//  Copyright © 2020 RYAN. All rights reserved.
//

import Foundation

class AppStoreRequest {
    //MARK: Static Variables
    private static var instance: AppStoreRequest?
    
    //MARK: Variables
    private var searchApi: SearchApi?
    
    //MARK: Functions
    static func getInstance() -> AppStoreRequest {
        if self.instance == nil {
            self.instance = AppStoreRequest()
        }
        return self.instance!
    }
    
    func search() -> SearchApi {
        if self.searchApi == nil {
            self.searchApi = SearchRequest()
        }
        return self.searchApi!
    }
}
