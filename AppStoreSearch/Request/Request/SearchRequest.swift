//
//  SearchRequest.swift
//  AppStoreSearch
//
//  Created by 이정환 on 2020/08/14.
//  Copyright © 2020 RYAN. All rights reserved.
//

import Foundation

class SearchRequest: SearchApi {
    
    //MARK: Functions
    func searchAppsList<T>(keyword: String, receiver: ResponseReceiver<T>) where T : AppSearchResult {
        let requestUrl = SearchApiUrl.baseUrl
        let term = Parameter().asTerm(text: keyword)
        RequestMaker().resumeGet(urlString: requestUrl, parameters: [term], completionHandler: receiver)
    }
}

