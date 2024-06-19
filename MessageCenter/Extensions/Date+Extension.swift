//
//  Date+Extension.swift
//  MessageCenter
//
//  Created by Jay Muthialu on 6/18/24.
//

import Foundation

extension Date {
    
    func toShortString() -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale.current
        formatter.dateFormat = "M/d/yyyy"
        return formatter.string(from: self)
    }
}
