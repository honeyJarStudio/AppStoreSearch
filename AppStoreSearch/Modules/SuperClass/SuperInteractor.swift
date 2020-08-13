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
    
    func setPresenter(presenter: InteractorOutput) {
        self.presenter = presenter
    }
}
