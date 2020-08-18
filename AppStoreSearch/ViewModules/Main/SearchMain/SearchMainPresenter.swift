//
//  SearchMainPresenter\.swift
//  AppStoreSearch
//
//  Created by 이정환 on 2020/08/14.
//  Copyright © 2020 RYAN. All rights reserved.
//

import Foundation

class SearchMainPresenter: SuperPresenter, SearchMainEventHandler, SearchMainInteractorOutput, SearchResultDelegateEvent, KeywordDelegate {
    
    //MARK: Variables
    var wireframe: SearchMainWireframe?
    private var view: SearchMainViewController? { return super.getView(type: SearchMainViewController.self) }
    private var interactor: SearchMainInteractorInput? { return super.getInteractor(type: SearchMainInteractor.self) }
    private var collectionViewDelegate = SearchResultCollectionDelegate()
    private var keywordCollectionDelegate = KeywordCollectionViewDelegate()
    
    //MARK: SuperPresenter Override
    override func setFundamentals() {
        // do something that is must needed.
        self.collectionViewDelegate.eventDelegate = self
        self.keywordCollectionDelegate.eventDelegate = self
    }
    
    //MARK: EventHandler
    func findRecentKeywords() {
        // do find recent keywords
        let array = RecentKeywordManager.getInstance().getKeywords()
        self.keywordCollectionDelegate.keywords = array
        self.view?.setKeywordDelegate(self.keywordCollectionDelegate)
        self.view?.searchResultReceived()
    }
    
    func findAppListWith(_ keyword: String) {
        // do find search result with keyword
        RecentKeywordManager.getInstance().addKeyword(keyword)
        self.collectionViewDelegate.appList = []
        self.view?.setCollectionViewDelegate(self.collectionViewDelegate)
        self.interactor?.requestSearchResult(with: keyword)
    }
    
    //MARK: InteractorOutput
    func searchResultReceived(_ result: AppSearchResult) {
        self.collectionViewDelegate.appList = []
        Logger.debugLog("data received from server.")
        Logger.debugLog("resultCount: \(String(describing:result.resultCount))")
        guard let list = result.results else {
            return
        }
        self.collectionViewDelegate.appList = list
        self.view?.searchResultReceived()
    }
    
    //MARK: SearchResultDelegateEvent
    func openUrlAction(url: URL) {
        self.view?.openUrl(url: url)
    }
    
    func browseAppAction(app: AppData) {
        self.wireframe?.pushToAppDetail(app: app)
    }
    
    //MARK: KeywordDelegate
    func keywordSelected(keyword: String) {
        self.findAppListWith(keyword)
        self.view?.keywordReceived(keyword: keyword)
    }
}
