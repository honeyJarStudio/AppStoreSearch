//
//  SearchMainViewController.swift
//  AppStoreSearch
//
//  Created by 이정환 on 2020/08/14.
//  Copyright © 2020 RYAN. All rights reserved.
//

import Foundation
import UIKit

class SearchMainViewController: SuperViewController<SuperPresenter>, SearchMainViewInterface, UISearchBarDelegate {
    //MARK: Variables
    private var eventHandler: SearchMainEventHandler? { return super.getEventHandler(type: SearchMainPresenter.self) }
    private var initialized: Bool = false
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collectionViewMain: UICollectionView!
    
    //MARK: Functions
    override func viewDidLoad() {
        Logger.infoLog("viewDidLoad() activated")
        self.searchBar.delegate = self
//        self.title = "검색"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.eventHandler?.setFundamentals()
        if !self.initialized {
            self.findDefaultData()
            self.initialized = true
        }
    }
    
    //MARK: SearchMainViewInterface
    func setCollectionViewDelegate(_ delegate: SearchResultCollectionDelegate) {
        delegate.setRequirements(collectionView: self.collectionViewMain)
        self.collectionViewMain.delegate = delegate
        self.collectionViewMain.dataSource = delegate
    }
    
    func setKeywordDelegate(_ delegate: KeywordCollectionViewDelegate) {
        delegate.setRequirements(collectionView: self.collectionViewMain)
        self.collectionViewMain.delegate = delegate
        self.collectionViewMain.dataSource = delegate
    }
    
    func findDefaultData() {
        self.eventHandler?.findRecentKeywords()
    }
    
    func searchResultReceived() {
        self.collectionViewMain.refreshData()
    }
    
    func keywordReceived(keyword: String) {
        self.searchBar.text = keyword
        self.searchBar.resignFirstResponder()
    }
    
    func openUrl(url: URL) {
        super.openURL(address: url.absoluteString, failMessage: "앱을 열 수 없습니다.")
    }
    
    //MARK: SearchBarDelegate
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let keyword = self.searchBar.text else {
//            self.eventHandler?.findAppListWith("")
            return
        }
        searchBar.resignFirstResponder()
        self.eventHandler?.findAppListWith(keyword)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.eventHandler?.findRecentKeywords()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == "" {
            self.eventHandler?.findRecentKeywords()
        }
    }
}
