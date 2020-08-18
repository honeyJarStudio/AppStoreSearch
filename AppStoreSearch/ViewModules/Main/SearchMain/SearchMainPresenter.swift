//
//  SearchMainPresenter\.swift
//  AppStoreSearch
//
//  Created by 이정환 on 2020/08/14.
//  Copyright © 2020 RYAN. All rights reserved.
//

import Foundation

class SearchMainPresenter: SuperPresenter, SearchMainEventHandler, SearchMainInteractorOutput {
    
    //MARK: Variables
    var wireframe: SearchMainWireframe?
    private var view: SearchMainViewController? { return super.getView(type: SearchMainViewController.self) }
    private var interactor: SearchMainInteractorInput? { return super.getInteractor(type: SearchMainInteractor.self) }
    private var collectionViewDelegate: SearchResultCollectionDelegate?
    
    //MARK: SuperPresenter Override
    override func setFundamentals() {
        // do something that is must needed.
    }
    
    //MARK: EventHandler
    func findRecentKeywords() {
        // do find recent keywords
    }
    
    func findAppListWith(_ keyword: String) {
        // do find search result with keyword
        self.collectionViewDelegate = SearchResultCollectionDelegate()
        self.view?.setCollectionViewDelegate(self.collectionViewDelegate!)
        self.interactor?.requestSearchResult(with: keyword)
    }
    
    //MARK: InteractorOutput
    func searchResultReceived(_ result: AppSearchResult) {
        Logger.debugLog("data received from server.")
        Logger.debugLog("resultCount: \(String(describing:result.resultCount))")
        guard let list = result.results else {
            return
        }
        self.collectionViewDelegate?.appList = list
        self.view?.searchResultReceived()
    }
}
