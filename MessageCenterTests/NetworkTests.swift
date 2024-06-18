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
        
        if let messages = try await messagesAPI.getMessages(forEmailId: emailId),
           messages.count > 0 {
            XCTAssertEqual(messages.count, 10, "Messages count is not equal")
            let firstMessage = messages[0]
            XCTAssertEqual(firstMessage.name, "Owen Short(Mock)")
            XCTAssertEqual(firstMessage.message, "Click to pay your bills online")
            
            let dateString = "2020-05-25T04:00:00.000Z"
            let formatter = Formatter.iso8601FractionalSeconds
            let dateFromString = formatter.date(from: dateString)
            XCTAssertEqual(firstMessage.date, dateFromString)
        }
    }
}
