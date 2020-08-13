//
//  ASSearchLogger.swift
//  AppStoreSearch
//
//  Created by 이정환 on 2020/08/12.
//  Copyright © 2020 RYAN. All rights reserved.
//

import Foundation
import os.log

class Logger {
    
    //MARK: static variables
    private static var instance: Logger?
    
    //MARK: static functions
    private static func getInstance() -> Logger {
        if self.instance == nil {
            self.instance = Logger()
        }
        return self.instance!
    }
    
    //MARK: functions
    static func infoLog(_ message: String) {
        os_log(.info, log: Logger.getInstance().catInfo(), "%@", message)
    }
    
    static func errorLog(_ message: String) {
        os_log(.error, log: Logger.getInstance().catError(), "%@", message)
    }
    
    static func debug(_ message: String) {
        os_log(.debug, log: Logger.getInstance().catDebug(), "%@", message)
    }
    
    private func catInfo() -> OSLog {
        return OSLog(subsystem: Constants.bundleId(), category: "info")
    }
    
    private func catError() -> OSLog {
        return OSLog(subsystem: Constants.bundleId(), category: "error")
    }
    
    private func catDebug() -> OSLog {
        return OSLog(subsystem: Constants.bundleId(), category: "debug")
    }
}
