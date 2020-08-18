//
//  UIViewControllerExtension.swift
//  AppStoreSearch
//
//  Created by 이정환 on 2020/08/18.
//  Copyright © 2020 RYAN. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func showAlertPopupWithCloseButton(title: String?, message: String, closeMessage: String?, buttonHandler: ((UIAlertAction) -> Void)?) {
        var finalClose: String = "확인"
        if let str = closeMessage {
            finalClose = str
        }
        let action = UIAlertAction(title: finalClose, style: .default, handler: buttonHandler)
        self.showAlertPopuptWithCustomButtons(title: title, message: message, action: [action])
    }
    
    func showAlertPopuptWithCustomButtons(title: String?, message: String, action: [UIAlertAction]) {
        var finalTitle: String = "알림"
        if let str = title {
            finalTitle = str
        }
        let alert = UIAlertController(title: finalTitle, message: message, preferredStyle: .alert)
        for act in action {
            alert.addAction(act)
        }
        // present
        self.present(alert, animated: true, completion: nil)
    }
}
