//
//  APIService.swift
//  MessageCenter
//
//  Created by Jay Muthialu on 6/18/24.
//

import Foundation
import Combine

class APIService {
    
    private let networkService: NetworkService?
    private let urlBuilder = URLBuilder()
    
    init(forType serviceType: NetworkFactory.ServiceType = .http,
         urlSession: URLSession = URLSession.shared) {
        networkService = NetworkFactory.getService(forType: serviceType,
                                                   urlSession: urlSession)
    }
      
    func getData<T: Decodable>(forPath path: String,
                               queryItems: [URLQueryItem] = [],
                               headers: [String: String] = [:]
    ) async throws -> [T]? {
        
        if networkService is HTTPService {
            guard let urlRequest = try urlBuilder.getURLRequest(
                for: path,
                queryItems: queryItems,
                headers: headers
            ) else {
                throw NetworkError.incorrectURL
            }
            return try await networkService?.getData(urlRequest: urlRequest)
        } else {
            guard let url = URL(string: MockPath.photos.rawValue) else {
                throw NetworkError.incorrectURL
            }
            let urlRequest = URLRequest(url: url)
            return try await networkService?.getData(urlRequest: urlRequest)
        }
    }
    
}
