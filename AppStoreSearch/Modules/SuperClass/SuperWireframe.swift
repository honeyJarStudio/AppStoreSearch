//
//  SuperWireframe.swift
//  AppStoreSearch
//
//  Created by 이정환 on 2020/08/12.
//  Copyright © 2020 RYAN. All rights reserved.
//

import Foundation
import UIKit

class SuperWireframe<V: ViewInterface, I: InteractorInput, P: InteractorOutput & EventHandler> {
    
    private let viewController: V
    private let interactor: I
    private let presenter: P
    
    init(view: V, interactor: I, presenter: P) {
        self.viewController = view
        self.interactor = interactor
        self.presenter = presenter
        view.setEventHandler(presenter)
        interactor.setPresenter(presenter)
        presenter.setInteractor(interactor)
        presenter.setView(view: view)
    }
    
    func present(this viewController: SuperViewController<P>, animated: Bool, completion: (() -> Void)?) {
        guard let vc = self.viewController.getViewController() else {
            self.noViewControllerError()
            return
        }
        viewController.presentSelf(from: vc, animated: animated, completion: completion)
    }
    
    func push(this viewController: SuperViewController<P>, from navigationController: UINavigationController?, animated: Bool) {
        let navigation: UINavigationController? = navigationController != nil ? navigationController : self.viewController.getNavigationController()
        guard let nav = navigation else {
            self.noNavigationError()
            return
        }
        self.viewController.pushSelf(from: nav, animated: animated)
    }
    
    func push(this viewController: SuperViewController<P>, animated: Bool) {
        self.push(this: viewController, from: self.viewController.getNavigationController(), animated: animated)
    }
    
    private func noNavigationError() {
        Logger.errorLog("No Navigation Controller to handle this request")
    }
    
    private func noViewControllerError() {
        Logger.errorLog("No ViewController to handle this request")
    }
}
