//
//  Message.swift
//  MessageCenter
//
//  Created by Jay Muthialu on 6/18/24.
//

import Foundation

struct Message: Decodable, Hashable {
    var id = UUID()
    var name: String?
    var date: Date?
    var message: String?
    
    private enum CodingKeys: String, CodingKey { case name, date, message }
}
