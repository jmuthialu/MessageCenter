//
//  URLPath.swift
//  MessageCenter
//
//  Created by Jay Muthialu on 6/18/24.
//

enum URLPath: String {
    case messages = "/messages/users"
    
    static func getPath(for path: URLPath) -> String {
        return path.rawValue
    }
    
    static func getMessagesPath(for emailId: String) -> String {
        return URLPath.messages.rawValue + "/" + emailId
    }
}

enum MockPath: String {
    case messages = "Messages1.json"
}
