//
//  MockHTTPService.swift
//  MessageCenter
//
//  Created by Jay Muthialu on 6/18/24.
//

import Foundation

struct MockHTTPService: NetworkService {
    
    func getData<T>(urlRequest: URLRequest) async throws -> T? where T: Decodable {
        let data = try loadFromFile(urlRequest: urlRequest)
        
        let jsonDecoder = JSONDecoder()
        jsonDecoder.dateDecodingStrategy = .iso8601Fractional
        let result = try jsonDecoder.decode(T.self, from: data)
        return result
    }
    
    func loadFromFile(urlRequest: URLRequest) throws -> Data {
        
        guard let fileURL = Bundle.main.url(forResource: urlRequest.url?.absoluteString,
                                          withExtension: "") else {
            throw NetworkError.invalidMockFile(urlRequest.url?.absoluteString ?? "")
        }
        
        Logger.log(tag: .networkModule, message: "Loading from file...")
        let data = try Data(contentsOf: fileURL)
        return data
    }
    
}
