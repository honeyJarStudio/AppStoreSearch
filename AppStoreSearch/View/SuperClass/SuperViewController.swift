//
//  SuperViewController.swift
//  AppStoreSearch
//
//  Created by 이정환 on 2020/08/12.
//  Copyright © 2020 RYAN. All rights reserved.
//

import Foundation
import UIKit

class SuperViewController: UIViewController, ViewInterface {
    
    private var eventHandler: SuperPresenter?
    
    func setPresenter(presenter: SuperPresenter) {
        self.eventHandler = presenter
    }
    
    func presentSelf(from viewController: UIViewController, animated: Bool, completion: (() -> Void)?) {
        viewController.present(self, animated: animated, completion: completion)
    }
    
    func pushSelf(from navigationController: UINavigationController, animated: Bool) {
        navigationController.pushViewController(self, animated: animated)
    }
    
    func getNavigationController() -> UINavigationController? {
        return self.navigationController
    }
    
    func getViewController() -> UIViewController? {
        return self
    }
}
