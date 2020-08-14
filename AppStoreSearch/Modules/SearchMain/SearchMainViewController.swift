//
//  SearchMainViewController.swift
//  AppStoreSearch
//
//  Created by 이정환 on 2020/08/14.
//  Copyright © 2020 RYAN. All rights reserved.
//

import Foundation

class SearchMainViewController: SuperViewController<SuperPresenter>, SearchMainViewInterface {
    //MARK: Variables
    private var eventHandler: SearchMainEventHandler? { return super.getEventHandler(type: SearchMainPresenter.self) }
    
    //MARK: Functions
    override func viewDidLoad() {
        Logger.infoLog("viewDidLoad() activated")
        self.findDefaultData()
    }
    
    //MARK: EventHandler
    func findDefaultData() {
        self.eventHandler?.findRecentKeywords()
        self.eventHandler?.findAppListWith("카카오뱅크")
    }
}
