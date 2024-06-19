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
    @Published var errorMessage = ""

    init(messagesAPI: MessagesAPI) {
        self.messagesAPI = messagesAPI
    }

    @MainActor
    @discardableResult
    func getMessages(forEmailID emailId: String) async -> [Message] {
        do {
            errorMessage = ""
            let sortedMessages: [Message] = try await messagesAPI.getSortedMessages(forEmailId: emailId) ?? []
            
            Logger.log(tag: .messagesView, message: "sortedMessages: \(sortedMessages)")
            messages = sortedMessages
            processError(messages: messages, error: nil)
        } catch {
            messages = []
            processError(messages: messages, error: error)
        }
        showProgressView = false
        return messages
    }
    
    func processError(messages: [Message]?, error: Error?) {
        if let error = error {
            if let networkError = error as? NetworkError {
                Logger.log(tag: .messagesView,
                           logType: .error,
                           message: "\(#function): \(networkError.description)")
            } else {
                Logger.log(tag: .messagesView,
                           logType: .error,
                           message: "\(#function): \(error)")
            }
            errorMessage = "Something went wrong. Please try again."
        } else if let messages = messages {
            if messages.isEmpty { errorMessage = "No messages found at this time." }
        } else {
            errorMessage = "No messages found at this time."
        }
    }
}
