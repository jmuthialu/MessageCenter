//
//  NetworkError.swift
//  MessageCenter
//
//  Created by Jay Muthialu on 6/18/24.
//

import Foundation

enum NetworkError: Error, CustomStringConvertible {
    case errorStatusCode(Int, String)
    case incorrectURL(String)
    case invalidMockFile(String, String)
    case noHTTPURLResponse(String)
    case noNetwork
    
    var description: String {
        switch self {
        case let .errorStatusCode(statusCode, functionDetails):
            return "Failed with HTTP status code: \(statusCode) at: \(functionDetails)"
        case let .incorrectURL(functionDetails):
            return "Incorrect URL String at: \(functionDetails)"
        case let .invalidMockFile(fileName, functionDetails):
            return "Could not load mock file: \(fileName) at: \(functionDetails)"
        case let .noHTTPURLResponse(functionDetails):
            return "No valid HTTPURLResponse at: \(functionDetails)"
        case .noNetwork:
            return "No network connection found!"
        
        }
    }
    
    var iconName: String {
        switch self {
        case .noNetwork:
            return "network.slash"
        default:
            return "network.slash" // replace with a generic error icon name
        }
    }
}
