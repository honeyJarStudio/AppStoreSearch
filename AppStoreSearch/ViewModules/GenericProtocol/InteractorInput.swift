//
//  InteractorInput.swift
//  AppStoreSearch
//
//  Created by 이정환 on 2020/08/12.
//  Copyright © 2020 RYAN. All rights reserved.
//

import Foundation

protocol InteractorInput {
    func setPresenter<T: InteractorOutput>(_ presenter: T)
}

protocol GatewayInteractorInput: InteractorInput {
    
}

protocol SearchMainInteractorInput: InteractorInput {
    func requestSearchResult(with keyword: String)
}

protocol AppDetailInteractorInput: InteractorInput {
    
}
