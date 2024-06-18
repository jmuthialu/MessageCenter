//
//  FontPalette.swift
//  MessageCenter
//
//  Created by Jay Muthialu on 6/18/24.
//

import SwiftUI

enum FontPalette {
    
    struct Constant {
        static let poppinsRegular = "Poppins-Regular"
        static let poppinsBold = "Poppins-Bold"
    }
    
    private enum Size: CGFloat {
        case small = 14
        case medium = 16
        case large = 24
    }

    private enum Style: String {
        case bold = "Bold"
        case regular = "Regular"
    }
    
    case largeRegular
    case mediumRegular
    case mediumBold
    case smallRegular
    
    var font: Font {
        switch self {
        case .largeRegular:
            return Font.custom(Constant.poppinsRegular, size: Size.large.rawValue)
        case .mediumRegular:
            return Font.custom(Constant.poppinsRegular, size: Size.medium.rawValue)
        case .mediumBold:
            return Font.custom(Constant.poppinsBold, size: Size.medium.rawValue)
        case .smallRegular:
            return Font.custom(Constant.poppinsRegular, size: Size.small.rawValue)
        }
    }
    
}
