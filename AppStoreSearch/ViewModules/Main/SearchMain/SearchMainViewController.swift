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
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collectionViewMain: UICollectionView!
    
    //MARK: Functions
    override func viewDidLoad() {
        Logger.infoLog("viewDidLoad() activated")
        self.findDefaultData()
        self.searchBar.delegate = self
    }
    
    //MARK: EventHandler
    func setCollectionViewDelegate(_ delegate: SearchResultCollectionDelegate) {
        delegate.setRequirements(collectionView: self.collectionViewMain)
        self.collectionViewMain.delegate = delegate
        self.collectionViewMain.dataSource = delegate
    }
    
    func findDefaultData() {
        self.eventHandler?.findRecentKeywords()
    }
    
    //MARK: SearchBarDelegate
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let keyword = self.searchBar.text else {
            return
        }
        self.eventHandler?.findAppListWith(keyword)
    }
    
    func searchResultReceived() {
        self.collectionViewMain.refreshData()
    }
}
