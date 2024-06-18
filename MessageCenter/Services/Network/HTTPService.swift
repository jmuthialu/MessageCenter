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
            Logger.log(tag: .networkModule,
                       logType: .error,
                       message: "Could not convert to HTTPURLResponse")
            throw NetworkError.noHTTPURLResponse
        }
        
        guard httpResponse.statusCode == 200 else {
            Logger.log(tag: .networkModule,
                       logType: .error,
                       message: "Error: getData(): Unsucessful status code: \(httpResponse.statusCode)")
            throw NetworkError.errorStatusCode(httpResponse.statusCode)
        }
        
        let jsonDecoder = JSONDecoder()
        jsonDecoder.dateDecodingStrategy = .iso8601Fractional
        let result = try jsonDecoder.decode(T.self, from: data)
        return result
    }
}
