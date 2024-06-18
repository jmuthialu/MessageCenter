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
    
    var messagesAPI: MessagesAPI

    @Published var messages = [Message]()
    @Published var showProgressView = true

    init(messagesAPI: MessagesAPI) {
        self.messagesAPI = messagesAPI
    }

    @discardableResult
    @MainActor
    func getMessages(forEmailID emailId: String) async -> [Message] {
        do {
            let messageArray: [Message] = try await messagesAPI.getMessages(forEmailId: emailId) ?? []
            
            print("messageArray: \(messageArray)")
            messages = messageArray.sorted { $0.date! > $1.date! }
        } catch {
            if let error = error as? NetworkError {
                Logger.log(tag: .messagesView, 
                           logType: .error,
                           message: "\(#function): \(error.description)")
            } else {
                Logger.log(tag: .messagesView, 
                           logType: .error,
                           message: "\(#function): \(error)")
            }

        }
        showProgressView = false
        return messages
    }
}
