//
//  RequestMaker.swift
//  AppStoreSearch
//
//  Created by 이정환 on 2020/08/14.
//  Copyright © 2020 RYAN. All rights reserved.
//

import Foundation

class RequestMaker {
    
    func resume<T: BaseObject>(method: HttpMethod, url asString: String, parameters: [Parameter], completion handler: ResponseReceiver<T>?) {
        // build up parameters
        var paramString: String = ""
        for idx in 0 ..< parameters.count {
            let param = parameters[idx]
            if let exported = param.exportParamString() {
                if idx == 0 {
                    paramString.append("?")
                } else {
                    paramString.append("&")
                }
                paramString.append(exported)
            }
            Logger.debugLog("parameterString created: \(paramString)")
        }
        // check paramString validity and append if valid
        var valid = asString
        if !paramString.isEmpty {
            valid.append(paramString)
        }
        // check url validity to make URL
        guard let validUrl = URL(string: valid) else {
            Logger.errorLog("this is not valid url: \(asString)")
            return
        }
        // build request
        var request = URLRequest(url: validUrl, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: .zero)
        request.httpMethod = method.rawValue
        // build session
        let session = URLSession.shared
        session.dataTask(with: request, completionHandler:
            { data, response, error in
                // error handling
                guard error == nil else {
                    var errorCreated: ApiError?
                    // Error situation
                    errorCreated = error as? ApiError
                    if let message = errorCreated?.localizedDescription {
                        Logger.errorLog(message, prefix: asString)
                    }
                    DispatchQueue.main.async {
                        handler?.getHandler()?(.failure, nil, errorCreated)
                    }
                    return
                }
                // success result handling
                guard let unwrapped = data else {
                    // data does not exist
                    let message = "response success, but result data does not exist."
                    Logger.errorLog(message, prefix: asString)
                    DispatchQueue.main.async {
                        handler?.getHandler()?(.failure, nil, nil)
                    }
                    return
                }
                // parsing
                guard let parsed = try? GlobalJSONDecoder.getDecoder().decode(T.self, from: unwrapped) else {
                    // data exist
                    Logger.errorLog("response success, but data parsing have failed", prefix: asString)
                    DispatchQueue.main.async {
                        handler?.getHandler()?(.failure, nil, nil)
                    }
                    return
                }
                // final result: success
                Logger.infoLog("request successfully ended", prefix: asString)
                DispatchQueue.main.async {
                    handler?.getHandler()?(.success, parsed, nil)
                }
            }
        ).resume() //finally, start network request
    }
    
    /// make GET request
    func resumeGet<T: BaseObject>(urlString: String, parameters: [Parameter], completionHandler: ResponseReceiver<T>?) {
        self.resume(method: .get, url: urlString, parameters: parameters, completion: completionHandler)
    }
}

struct ApiError: Error {
    
}
