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
        static let host = "api.unsplash.com"
        static let apiKey = "12ed97d4dfa3d6c2cb6b05e407bec679de632f8392b37ec23df0b3809979e337"
        static let authHeaderKey = "Authorization"
        static let authorization = "Client-ID \(Constant.apiKey)"
        static let httpGET = "GET"
        static let httpPOST = "POST"
    }
    
    var baseHeaders: [String: String] {
        [Constant.authHeaderKey: Constant.authorization]
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
                       headers: [String: String]) -> URLRequest? {
        
        guard let url = getURL(for: path, queryItems: queryItems) else { return nil }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = Constant.httpGET
        urlRequest.allHTTPHeaderFields = headers
        return urlRequest
    }
}
