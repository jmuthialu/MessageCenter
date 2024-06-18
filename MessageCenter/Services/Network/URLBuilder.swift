//
//  URLBuilder.swift
//  MessageCenter
//
//  Created by Jay Muthialu on 6/18/24.
//

import Foundation

struct URLBuilder {
    
    struct Constant {
        static let scheme = "https"
        static let host = "vcp79yttk9.execute-api.us-east-1.amazonaws.com"
        static let httpGET = "GET"
        static let httpPOST = "POST"
    }
        
    func getURL(for path: String, queryItems: [URLQueryItem]) -> URL? {
        var components = URLComponents()
        components.scheme = Constant.scheme
        components.host = Constant.host
        components.path = path
        components.queryItems = queryItems
        return components.url
    }

    func getURLRequest(for path: String,
                       queryItems: [URLQueryItem],
                       headers: [String: String]) throws -> URLRequest? {
        
        guard let url = getURL(for: path, queryItems: queryItems) else {
            Logger.log(tag: .networkModule, message: "URL could not be obtained")
            throw NetworkError.incorrectURL
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = Constant.httpGET
        urlRequest.allHTTPHeaderFields = headers
        return urlRequest
    }
}
