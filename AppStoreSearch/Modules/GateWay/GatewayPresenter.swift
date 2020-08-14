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
    private var wireframe = GatewayWireframe(view: GatewayViewController(), interactor: GatewayInteractor(), presenter: GatewayPresenter())
    private var view: GatewayViewInterface? { return super.getView(type: GatewayViewController.self) }
    private var interactor: GatewayInteractor? { return super.getInteractor(type: GatewayInteractor.self) }
    
    //MARK: SuperPresenter Override
    override func setFundamentals() {
        // do something that is must needed.
    }
}
