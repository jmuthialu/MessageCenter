//
//  ButtonWithErrorHandler.swift
//  MessageCenter
//
//  Created by Jay Muthialu on 6/24/24.
//

import SwiftUI

struct ButtonWithErrorHandler: View {
    
    let buttonText: String
    let errorMessage: String?
    let errorIconName: String?
    let actionBlock: () -> Void
    let genericIconName = "square.and.arrow.up"
    
    var body: some View {
        VStack {
            HStack { // Handle error message and error icon
                if let errorMessage = errorMessage, let errorIconName = errorIconName {
                    Image(systemName: errorIconName)
                        .resizable()
                        .frame(width: 25, height: 25)
                    Text(errorMessage)
                        .font(FontPalette.mediumRegular.font)
                        .foregroundColor(ColorPalette.primaryRed.color)
                } else { // Added empty views to avoid movements in view when the state changes
                    Image(systemName: genericIconName)
                        .resizable()
                        .frame(width: 25, height: 25)
                        .hidden()
                    Text(StringConstants.singleSpaced)
                        .font(FontPalette.mediumRegular.font)
                        .foregroundColor(ColorPalette.primaryRed.color)
                }
            }
            .padding(.bottom, 10)
            
            Button(buttonText) { actionBlock() }
                .padding()
                .background((errorMessage == nil) ? ColorPalette.primaryBlue.color: ColorPalette.primaryGrey.color)
                .foregroundColor(ColorPalette.primaryText.color)
                .clipShape(.rect(cornerRadius: 5))
                .disabled(errorMessage != nil)
            
        }
    }
}
