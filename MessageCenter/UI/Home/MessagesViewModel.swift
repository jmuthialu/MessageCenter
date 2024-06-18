//
//  MessagesViewModel.swift
//  MessageCenter
//
//  Created by Jay Muthialu on 6/18/24.
//

import SwiftUI
import Foundation
import Combine

class MessagesViewModel: ObservableObject {
    
    var apiService: APIService

    @Published var messages = [Message]()
    @Published var showProgressView = true

    init(networkServiceType: NetworkFactory.ServiceType) {
        apiService = APIService(forType: networkServiceType)
    }

    @discardableResult
    @MainActor
    func getMessages(emailID: String) async -> [Message] {
        do {
            let path = URLPath.messages.rawValue + "/" + emailID
            
            let messageArray: [Message] = try await apiService.getData(forPath: path) ?? []
            
            print("messageArray: \(messageArray)")
            messages = messageArray.sorted { $0.date! > $1.date! }
        } catch {
            if let error = error as? NetworkError {
                Logger.log(tag: .messagesView, logType: .error, message: "getMessages() with desc: \(error.description)")
            } else {
                Logger.log(tag: .messagesView, logType: .error, message: "getMessages(): \(error)")
            }

        }
        showProgressView = false
        return messages
    }
}
