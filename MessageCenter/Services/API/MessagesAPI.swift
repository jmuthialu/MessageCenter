//
//  MessagesAPI.swift
//  MessageCenter
//
//  Created by Jay Muthialu on 6/18/24.
//

import Foundation

class MessagesAPI: BaseAPI {
    
    struct Constants {
        static let path = "/messages/users"
        static let mockFile = "Messages.json"
    }
    
    func getMessages(forEmailId emailId: String) async throws -> [Message]? {
        guard let urlRequest = try buildURLRequest(forEmailId: emailId) else {
            throw NetworkError.incorrectURL(#function)
        }
        return try await networkService.getData(urlRequest: urlRequest)
    }
    
    private func buildURLRequest(forEmailId emailId: String) throws -> URLRequest? {
        if networkService is HTTPService {
            let path = Constants.path + "/" + emailId
            return try URLBuilder().makeURLRequest(forPath: path)
        } else {
            guard let url = URL(string: Constants.mockFile) else {
                throw NetworkError.incorrectURL(#function)
            }
            return URLRequest(url: url)
        }
    }
}