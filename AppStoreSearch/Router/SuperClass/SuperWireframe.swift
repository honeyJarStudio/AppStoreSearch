//
//  SuperWireframe.swift
//  AppStoreSearch
//
//  Created by 이정환 on 2020/08/12.
//  Copyright © 2020 RYAN. All rights reserved.
//

import Foundation
import UIKit

class SuperWireframe {
    
    private let viewController: ViewInterface
    private let interactor: InteractorInput
    private let presenter: InteractorOutput
    
    init(view: ViewInterface, interactor: InteractorInput, presenter: InteractorOutput) {
        self.viewController = view
        self.interactor = interactor
        self.presenter = presenter
    }
    
    func present(this viewController: SuperViewController, animated: Bool, completion: (() -> Void)?) {
        guard let vc = self.viewController.getViewController() else {
            self.noViewControllerError()
            return
        }
        viewController.presentSelf(from: vc, animated: animated, completion: completion)
    }
    
    func push(this viewController: SuperViewController, from navigationController: UINavigationController?, animated: Bool) {
        let navigation: UINavigationController? = navigationController != nil ? navigationController : self.viewController.getNavigationController()
        guard let nav = navigation else {
            self.noNavigationError()
            return
        }
        self.viewController.pushSelf(from: nav, animated: animated)
    }
    
    func push(this viewController: SuperViewController, animated: Bool) {
        self.push(this: viewController, from: self.viewController.getNavigationController(), animated: animated)
    }
    
    private func noNavigationError() {
        Logger.errorLog("No Navigation Controller to handle this request")
    }
    
    private func noViewControllerError() {
        Logger.errorLog("No ViewController to handle this request")
    }
}
