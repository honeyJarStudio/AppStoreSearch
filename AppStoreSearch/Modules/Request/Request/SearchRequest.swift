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
        let requestUrl = self.baseUrl()
        let term = Parameter().asTerm(text: keyword)
        let entity = Parameter().asEntity(value: .software)
        RequestMaker().resumeGet(urlString: requestUrl, parameters: [term, entity], completionHandler: receiver)
    }
}

