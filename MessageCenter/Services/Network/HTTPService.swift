//
//  HTTPService.swift
//  MessageCenter
//
//  Created by Jay Muthialu on 6/18/24.
//

import Foundation

class HTTPService: NetworkService {
    
    let urlSession: URLSession
    
    init(urlSession: URLSession = URLSession.shared) {
        self.urlSession = urlSession
    }
    
    func getData<T: Decodable>(urlRequest: URLRequest) async throws -> T? {
        let (data, response) = try await urlSession.data(for: urlRequest)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.noHTTPURLResponse(#function)
        }
        
        guard httpResponse.statusCode == 200 else {
            throw NetworkError.errorStatusCode(httpResponse.statusCode, #function)
        }
        
        let jsonDecoder = JSONDecoder()
        jsonDecoder.dateDecodingStrategy = .customISO8601Fractional
        return try jsonDecoder.decode(T.self, from: data)
    }
}
