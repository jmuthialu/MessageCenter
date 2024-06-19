//
//  BaseAPI.swift
//  MessageCenter
//
//  Created by Jay Muthialu on 6/18/24.
//

import Foundation

class BaseAPI {
    
    let networkService: NetworkService
    
    init(forType serviceType: NetworkFactory.ServiceType = .http,
         urlSession: URLSession = URLSession.shared) {
        
        networkService = NetworkFactory.getService(forType: serviceType,
                                                   urlSession: urlSession)
    }
    
    func getData<T: Decodable>(urlRequest: URLRequest) async throws -> T? {
        return try await networkService.getData(urlRequest: urlRequest)
    }

}
