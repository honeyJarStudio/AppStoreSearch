//
//  GatewayPresenter.swift
//  AppStoreSearch
//
//  Created by 이정환 on 2020/08/14.
//  Copyright © 2020 RYAN. All rights reserved.
//

import Foundation

class GatewayPresenter: SuperPresenter, GatewayEventHandler, GatewayInteractorOutput {
    
    //MARK: Variables
    private var wireframe: GatewayWireframe?
    private var view: GatewayViewInterface? { return super.getView(type: GatewayViewController.self) }
    private var interactor: GatewayInteractor? { return super.getInteractor(type: GatewayInteractor.self) }
    
    //MARK: SuperPresenter Override
    override func setFundamentals() {
        // do something that is must needed.
    }
    
    func applicationInitialize(with viewController: GatewayViewController) {
        let interactor = GatewayInteractor()
        let wireframe = GatewayWireframe(view: viewController, interactor: interactor, presenter: self)
        self.wireframe = wireframe
        self.initCompleted()
    }
    
    private func initCompleted() {
        self.wireframe?.presentSearchMain()
    }
}
