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
    private static var debug: Bool = true
    
    //MARK: static functions
    static func state(debug: Bool) {
        self.debug = debug
    }
    
    private static func getInstance() -> Logger {
        if self.instance == nil {
            self.instance = Logger()
        }
        return self.instance!
    }
    
    //MARK: functions
    static func infoLog(_ message: String) {
        self.infoLog(message, prefix: nil)
    }
    
    static func infoLog(_ message: String, prefix: String?) {
        let converted = self.getAttachment(message: message, prefix: prefix)
        os_log(.info, log: Logger.getInstance().catInfo(), "%@", converted)
    }
    
    static func errorLog(_ message: String) {
        self.errorLog(message, prefix: nil)
    }
    
    static func errorLog(_ message: String, prefix: String?) {
        let converted: String = self.getAttachment(message: message, prefix: prefix)
        os_log(.error, log: Logger.getInstance().catError(), "%@", converted)
    }
    
    static func debugLog(_ message: String) {
        self.debugLog(message, prefix: nil)
    }
    
    static func debugLog(_ message: String, prefix: String?) {
        let converted: String = self.getAttachment(message: message, prefix: prefix)
        if self.debug {
            os_log(.debug, log: Logger.getInstance().catDebug(), "%@", converted)
        }
    }
    
    private static func getAttachment(message: String, prefix: String?) -> String {
        var attachment: String = ""
        if let str = prefix {
            attachment.append("|")
            attachment.append(str)
            attachment.append("|")
        }
        let converted: String = "\(attachment) \(message)"
        return converted
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
    
    private func catNetwork() -> OSLog {
        return OSLog(subsystem: Constants.bundleId(), category: "network")
    }
}
