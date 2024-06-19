//
//  ColorPalette.swift
//  MessageCenter
//
//  Created by Jay Muthialu on 6/18/24.
//

import SwiftUI

enum ColorPalette: String {
    
    case primaryText = "#FFFFFF"
    case primaryBlue = "#004FB5"
    
    var color: Color {
        return Color(hex: self.rawValue)
    }
    
}
