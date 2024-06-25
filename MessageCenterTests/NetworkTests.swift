//
//  NetworkTests.swift
//  MessageCenterTests
//
//  Created by Jay Muthialu on 6/18/24.
//

import XCTest
@testable import MessageCenter

final class NetworkTests: XCTestCase {

    func testMessageAPI() async throws {
        let emailId = "mtaylor@gmail.com"
        let messagesAPI = MessagesAPI(forType: .mock)
        
        if let messages = try await messagesAPI.getSortedMessages(forEmailId: emailId),
           messages.count > 0 {
            XCTAssertEqual(messages.count, 72, "Messages count is not equal")
            let firstMessage = messages[0]
            XCTAssertEqual(firstMessage.name, "Jay 123")
            XCTAssertEqual(firstMessage.message, "Click to pay your bills online")
            
            let dateString = "2024-06-19T04:00:00.000Z"
            let formatter = Formatter.iso8601FractionalSeconds
            let dateFromString = formatter.date(from: dateString)
            XCTAssertEqual(firstMessage.date, dateFromString)
        }
    }
}
