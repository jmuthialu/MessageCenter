//
//  ThemedButton.swift
//  MessageCenter
//
//  Created by Jay Muthialu on 6/18/24.
//

import SwiftUI

struct ThemedButton: View {
    
    let buttonText: String
    let actionBlock: () -> Void
    
    var body: some View {
        Button(buttonText) { actionBlock() }
            .padding()
            .background(ColorPalette.primaryBlue.color)
            .foregroundColor(ColorPalette.primaryText.color)
            .clipShape(.rect(cornerRadius: 5))
    }
}
