//
//  File.swift
//  AppStoreSearch
//
//  Created by 이정환 on 2020/08/14.
//  Copyright © 2020 RYAN. All rights reserved.
//

import Foundation

class GatewayInteractor: SuperInteractor, GatewayInteractorInput {
    
    //MARK: Variables
    private var presenter: GatewayInteractorOutput? {
        return super.getPresenter(GatewayPresenter.self)
    }
}
