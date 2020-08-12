//
//  SuperPresenter.swift
//  AppStoreSearch
//
//  Created by 이정환 on 2020/08/12.
//  Copyright © 2020 RYAN. All rights reserved.
//

import Foundation

class SuperPresenter: EventHandler, InteractorOutput {
    
    private var view: ViewInterface?
    private var interactor: InteractorInput?
    private var wireframe: SuperWireframe?
    
    func setView(view: ViewInterface) {
        self.view = view
    }
    
    func setInteractor(interactor: InteractorInput) {
        self.interactor = interactor
    }
    
    func setWireframe(wireframe: SuperWireframe) {
        self.wireframe = wireframe
    }
}
