//
//  Constants.swift
//  AppStoreSearch
//
//  Created by 이정환 on 2020/08/12.
//  Copyright © 2020 RYAN. All rights reserved.
//

import Foundation

class Constants {
    static func bundleId() -> String {
        guard let bundleID = Bundle.main.bundleIdentifier else { return "com.ryan.AppStoreSearch" }
        return bundleID
    }
}
