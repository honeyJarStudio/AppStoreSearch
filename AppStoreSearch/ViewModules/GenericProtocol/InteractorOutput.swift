//
//  InteractorOutput.swift
//  AppStoreSearch
//
//  Created by 이정환 on 2020/08/12.
//  Copyright © 2020 RYAN. All rights reserved.
//

import Foundation

protocol InteractorOutput {
    func setInteractor<T: InteractorInput>(_ interactor: T)
}

protocol GatewayInteractorOutput: InteractorOutput {
    
}

protocol SearchMainInteractorOutput: InteractorOutput {
    func searchResultReceived(_ result: AppSearchResult)
}

protocol AppDetailInteractorOutput: InteractorOutput {
    
}
