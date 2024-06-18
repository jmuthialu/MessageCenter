//
//  JSONDecoder+Extension.swift
//  MessageCenter
//
//  Created by Jay Muthialu on 6/18/24.
//

import Foundation

extension JSONDecoder.DateDecodingStrategy {
    
    static let customISO8601Fractional = custom {
        let container = try $0.singleValueContainer()
        let dateString = try container.decode(String.self)
        var date = Formatter.iso8601FractionalSeconds.date(from: dateString)
        date = date ?? Formatter.iso8601NonFractionalSeconds.date(from: dateString)
        guard let formattedDate = date else {
            throw DecodingError.dataCorruptedError(in: container, debugDescription: "Invalid date format: \(dateString)")
        }
        return formattedDate
    }
}
