//
//  Logger.swift
//  MessageCenter
//
//  Created by Jay Muthialu on 6/18/24.
//

import Foundation

struct Logger {
    
    enum Tag: String {
        case homeView
        case messagesModule
        case networkModule
    }
    
    enum LogType {
        case info
        case warning
        case error
    }
    
    enum LogLevel {
        case verbose
        case terse
    }
    
    static var logLevel: LogLevel = .verbose
    
    static func log(tag: Tag,
                    logType: LogType = .info,
                    message: String) {
        #if DEBUG
        if logLevel == .verbose {
            if logType == .error {
                print("\(tag.rawValue): \(logType): \(message)")
            } else {
                print("\(tag.rawValue): \(message)")
            }
        } else {
            if logType == .error {
                print("\(tag.rawValue): \(logType): \(message)")
            }
        }
        #endif
    }
}
