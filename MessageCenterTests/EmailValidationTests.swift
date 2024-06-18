//
//  EmailValidationTests.swift
//  MessageCenterTests
//
//  Created by Jay Muthialu on 6/18/24.
//

import XCTest
@testable import MessageCenter

final class EmailValidationTests: XCTestCase {

    func testEmailCheckGreen() {
        var emailId = "rob@gmail.com"
        XCTAssertTrue(emailId.isValidEmailId(), "Failed email check green test")
        
        emailId = "r@g.com"
        XCTAssertTrue(emailId.isValidEmailId(), "Failed email check green test")
        
        emailId = "+@g.co"
        XCTAssertTrue(emailId.isValidEmailId(), "Failed email check green test")
    }
    
    func testEmailCheckRed() {
        var emailId = "@gmail.com"
        XCTAssertFalse(emailId.isValidEmailId(), "Failed email check red test")
        
        emailId = "gcom"
        XCTAssertFalse(emailId.isValidEmailId(), "Failed email check red test")
        
        emailId = ""
        XCTAssertFalse(emailId.isValidEmailId(), "Failed email check red test")
        
        emailId = "x"
        XCTAssertFalse(emailId.isValidEmailId(), "Failed email check red test")
        
        emailId = "x.com"
        XCTAssertFalse(emailId.isValidEmailId(), "Failed email check red test")

    }

}
