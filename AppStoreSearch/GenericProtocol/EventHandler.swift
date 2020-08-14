//
//  EventHandler.swift
//  AppStoreSearch
//
//  Created by 이정환 on 2020/08/12.
//  Copyright © 2020 RYAN. All rights reserved.
//

import Foundation

protocol EventHandler {
    func setView<T: ViewInterface>(view: T)
    func setFundamentals()
}

protocol GatewayEventHandler: EventHandler {

}

protocol SearchMainEventHandler: EventHandler {
    func findRecentKeywords()
    func findAppListWith(_ keyword: String)
}
