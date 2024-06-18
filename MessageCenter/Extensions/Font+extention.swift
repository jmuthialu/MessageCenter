//
//  Font+Extension.swift
//  MessageCenter
//
//  Created by Jay Muthialu on 6/18/24.
//

import SwiftUI

extension Font {
    
    static func printFontNames() {
        for family in UIFont.familyNames.sorted() where family == "Poppins" {
            let names = UIFont.fontNames(forFamilyName: family)
            print("Family: \(family) Font names: \(names)")
        }
    }
    
}
