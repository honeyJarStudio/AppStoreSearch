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
    
    //MARK: Variables
    private let viewController: V
    private let interactor: I
    private let presenter: P
    
    //MARK: Initializer
    init(view: V, interactor: I, presenter: P) {
        self.viewController = view
        self.interactor = interactor
        self.presenter = presenter
        view.setEventHandler(presenter)
        interactor.setPresenter(presenter)
        presenter.setInteractor(interactor)
        presenter.setView(view: view)
    }
    
    //MARK: Functions
    func present(this viewController: UIViewController, animated: Bool, completion: (() -> Void)?) {
        guard let vc = self.viewController.getViewController() else {
            self.noViewControllerError()
            return
        }
        vc.present(viewController, animated: animated, completion: nil)
    }
    
    func push(this viewController: UIViewController, from navigationController: UINavigationController, animated: Bool) {
        navigationController.pushViewController(viewController, animated: animated)
    }
    
    func push(this viewController: UIViewController, animated: Bool) {
        guard let nav = self.viewController.getNavigationController() else {
            self.present(this: viewController, animated: animated, completion: nil)
            return
        }
        self.push(this: viewController, from: nav, animated: animated)
    }
    
    //MARK: Error Handlers
    private func noNavigationError() {
        Logger.errorLog("No Navigation Controller to handle this request")
    }
    
    private func noViewControllerError() {
        Logger.errorLog("No ViewController to handle this request")
    }
    
    //MARK: wireframe jobs
    func presentSearchMain() {
        let presenter = SearchMainPresenter()
        let interactor = SearchMainInteractor()
        guard let vc: SearchMainViewController = UIStoryboard(name: StoryboardName.main.rawValue, bundle: nil).instantiateViewController(withIdentifier: VCIdentifier.searchMain.rawValue) as? SearchMainViewController else {
            Logger.errorLog("error within instantiate viewcontroller process", prefix: "SuperWireframe: SearchMainWireframe")
            return
        }
        let wireframe = SearchMainWireframe(view: vc, interactor: interactor, presenter: presenter)
        presenter.wireframe = wireframe
        guard let nav = UIStoryboard(name: StoryboardName.main.rawValue, bundle: nil).instantiateViewController(withIdentifier: VCIdentifier.rootNavigtaion.rawValue) as? RootNavigationController else {
            vc.modalPresentationStyle = .fullScreen
            self.present(this: vc, animated: true, completion: nil)
            return
        }
        nav.modalPresentationStyle = .fullScreen
        nav.viewControllers = [vc]
        self.present(this: nav, animated: true, completion: nil)
    }
    
    func pushToAppDetail(app: AppData) {
        let presenter = AppDetailPresenter()
        let interactor = AppDetailInteractor()
        guard let vc: AppDetailViewController = UIStoryboard(name: StoryboardName.main.rawValue, bundle: nil).instantiateViewController(withIdentifier: VCIdentifier.appDetail.rawValue) as? AppDetailViewController else {
            Logger.errorLog("error within instantiate viewcontroller process", prefix: "SuperWireframe: AppDetailViewController")
            return
        }
        presenter.appData = app
        let wireframe = AppDetailWireframe(view: vc, interactor: interactor, presenter: presenter)
        presenter.wireframe = wireframe
        self.push(this: vc, animated: true)
    }
}
