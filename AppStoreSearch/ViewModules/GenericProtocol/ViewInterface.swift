//
//  ViewInterface.swift
//  AppStoreSearch
//
//  Created by 이정환 on 2020/08/12.
//  Copyright © 2020 RYAN. All rights reserved.
//

import Foundation
import UIKit

protocol ViewInterface {
    func setEventHandler<T: EventHandler>(_ handler: T)
    func getNavigationController() -> UINavigationController?
    func getViewController() -> UIViewController?
}

protocol GatewayViewInterface: ViewInterface {
    
}

protocol SearchMainViewInterface: ViewInterface {
    func setCollectionViewDelegate(_ delegate: SearchResultCollectionDelegate)
    func findDefaultData()
    func searchResultReceived()
}
