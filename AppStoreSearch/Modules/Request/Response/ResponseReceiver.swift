//
//  ResponseReceiver.swift
//  AppStoreSearch
//
//  Created by 이정환 on 2020/08/14.
//  Copyright © 2020 RYAN. All rights reserved.
//

import Foundation

class ResponseReceiver<T: BaseObject> {
    
    typealias CompletionHandler = (_ status: ResponseStatus, _ object: T?, _ error: ApiError?) -> Void
    private var receiver: CompletionHandler?
    
    init(_ receiver: @escaping CompletionHandler) {
        self.receiver = receiver
    }
    
    func getHandler() -> CompletionHandler? {
        return self.receiver
    }
}
