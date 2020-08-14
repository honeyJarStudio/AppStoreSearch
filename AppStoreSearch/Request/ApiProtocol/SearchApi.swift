//
//  SearchApi.swift
//  AppStoreSearch
//
//  Created by 이정환 on 2020/08/14.
//  Copyright © 2020 RYAN. All rights reserved.
//

import Foundation

protocol SearchApi {
    func searchAppsList<T: AppSearchResult>(keyword: String, receiver: ResponseReceiver<T>)
}

struct SearchApiUrl {
    static var baseUrl: String = "https://itunes.apple.com/search"
}
