//
//  SuperViewController.swift
//  AppStoreSearch
//
//  Created by 이정환 on 2020/08/12.
//  Copyright © 2020 RYAN. All rights reserved.
//

import Foundation
import UIKit

class SuperViewController<E: EventHandler>: UIViewController, ViewInterface {
    
    private var eventHandler: E?
    
    func setEventHandler<T: EventHandler>(_ handler: T) {
        self.eventHandler = handler as? E
    }
    
    func getNavigationController() -> UINavigationController? {
        return self.navigationController
    }
    
    func getViewController() -> UIViewController? {
        return self
    }
    
    func getEventHandler<T: EventHandler>(type: T.Type) -> T? {
        return self.eventHandler as? T
    }
    
    func openURL(address: String?, failMessage: String) {
        // go to dev website
        guard let urlString = address, let url = URL(string: urlString) else {
            return
        }
        if !UIApplication.shared.canOpenURL(url) {
            // cannot open url
            self.showAlertPopupWithCloseButton(title: nil, message: failMessage, closeMessage: nil, buttonHandler: nil)
            return
        } else {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}
