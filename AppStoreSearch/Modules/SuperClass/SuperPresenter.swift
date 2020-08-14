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
    
    func setView<T: ViewInterface>(view: T) {
        self.view = view
    }
    
    func setInteractor<T: InteractorInput>(_ interactor: T) {
        self.interactor = interactor
    }
    
    func getInteractor<T: InteractorInput>(type: T.Type) -> T? {
        return self.interactor as? T
    }
    
    func getView<T: ViewInterface>(type: T.Type) -> T? {
        return self.view as? T
    }
    
    func setFundamentals() {
        Logger.errorLog("you must override setFundamentals() in your presenter.")
    }
}
