//
//  SearchMainInteractor.swift
//  AppStoreSearch
//
//  Created by 이정환 on 2020/08/14.
//  Copyright © 2020 RYAN. All rights reserved.
//

import Foundation

class SearchMainInteractor: SuperInteractor, SearchMainInteractorInput {
    
    private var presenter: SearchMainInteractorOutput? {
        return super.getPresenter(SearchMainPresenter.self)
    }
    
    //MARK: InteractorInput
    func requestSearchResult(with keyword: String) {
        AppStoreRequest.getInstance().search().searchAppsList(keyword: keyword, receiver: ResponseReceiver(
            { status, object, error in
                if status == .success {
                    // success handling
                    if let result = object {
                        // has result
                        self.presenter?.searchResultReceived(result)
                    }
                }
                // error handled in RequestMaker.
            }
        )
        )
    }
}
