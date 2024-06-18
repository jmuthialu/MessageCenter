//
//  NetworkTests.swift
//  MessageCenterTests
//
//  Created by Jay Muthialu on 6/18/24.
//

import XCTest
@testable import MessageCenter

final class NetworkTests: XCTestCase {

    func testMessageAPI() async {
        let apiService = APIService(forType: .mock)
    }

}
