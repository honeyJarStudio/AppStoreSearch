//
//  SuperInteractor.swift
//  AppStoreSearch
//
//  Created by 이정환 on 2020/08/12.
//  Copyright © 2020 RYAN. All rights reserved.
//

import Foundation

class SuperInteractor: InteractorInput {
    
    private var presenter: InteractorOutput?
    
    func setPresenter<T: InteractorOutput>(_ presenter: T) {
        self.presenter = presenter
    }
    
    func getPresenter<T: InteractorOutput>(_ type: T.Type) -> T? {
        return self.presenter as? T
    }
}
