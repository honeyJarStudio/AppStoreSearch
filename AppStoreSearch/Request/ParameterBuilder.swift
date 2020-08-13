//
//  ParameterBuilder.swift
//  AppStoreSearch
//
//  Created by 이정환 on 2020/08/13.
//  Copyright © 2020 RYAN. All rights reserved.
//

import Foundation

class ParameterBuilder {
    
    //MARK: Variables
    private var parameters: [Parameter] = []
    
    //MARK: Functions
    func append(key: String, value: Any) -> ParameterBuilder {
        let param = Parameter()
        param.set(key: key, value: value)
        self.parameters.append(param)
        return self
    }
    
    private func build(params: [Parameter]) -> [String : String] {
        var dic: [String : String] = [:]
        for param in params {
            if let key = param.getKey(), let value = param.getValue() {
                dic[key] = "\(value)"
            }
        }
        return dic
    }
}
