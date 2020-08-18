//
//  Constants.swift
//  AppStoreSearch
//
//  Created by 이정환 on 2020/08/12.
//  Copyright © 2020 RYAN. All rights reserved.
//

import Foundation
import UIKit

class Constants {
    
    static func bundleId() -> String {
        guard let bundleID = Bundle.main.bundleIdentifier else { return "com.ryan.AppStoreSearch" }
        return bundleID
    }
    
    static func getScreenWidth() -> CGFloat {
        return UIScreen.main.bounds.width
    }
    
    static func getAppUrlWithID(id: Int) -> String {
        return "itms-apps://itunes.apple.com/app/id\(id)"
    }
    
    static func getAppStoreWebUrlWithID(id: Int) -> String {
        return "https://apps.apple.com/app/id\(id)"
    }
    
    static func getScreenShotHeightMultiplier() -> CGFloat {
        return 2688/1242 //default screenshot size.
    }
}
