//
//  TryAgainView.swift
//  MessageCenter
//
//  Created by Jay Muthialu on 6/19/24.
//

import SwiftUI

struct TryAgainView: View {
    
    let errorMessage: String
    let actionBlock: () -> Void
    
    var body: some View {
        VStack {
            Text(errorMessage)
                .font(FontPalette.mediumRegular.font)
                .padding()
            
            ButtonWithErrorHandler(buttonText: String(localized: StringConstants.tryAgain),
                                   errorMessage: nil,
                                   errorIconName: nil) {
                Task {
                    actionBlock()
                }
            }
        }
    }
}
