//
//  NetworkFactory.swift
//  MessageCenter
//
//  Created by Jay Muthialu on 6/18/24.
//

import Foundation

protocol NetworkService {
    func getData<T: Decodable>(urlRequest: URLRequest) async throws -> T?
}

struct NetworkFactory {
    
    enum ServiceType {
        case http
        case mock
    }
    
    static func getService(forType serviceType: ServiceType,
                           urlSession: URLSession = URLSession.shared) -> NetworkService {
        switch serviceType {
        case .http:
            return HTTPService(urlSession: urlSession)
        case.mock:
            return MockHTTPService()
        }
    }
}
