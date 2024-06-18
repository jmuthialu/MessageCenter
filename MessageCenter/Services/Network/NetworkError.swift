//
//  NetworkError.swift
//  MessageCenter
//
//  Created by Jay Muthialu on 6/18/24.
//

import Foundation

enum NetworkError: Error, CustomStringConvertible {
    case errorStatusCode(Int)
    case incorrectURL
    case invalidMockFile(String)
    case noHTTPURLResponse
    
    var description: String {
        switch self {
        case .errorStatusCode(let statusCode):
            return "Failed HTTP status code: \(statusCode)"
        case .incorrectURL:
            return "Incorrect URL String"
        case let .invalidMockFile (fileName):
            return "Invalid mock file: \(fileName)"
        case .noHTTPURLResponse:
            return "No valid HTTPURLResponse"
        }
    }
}
