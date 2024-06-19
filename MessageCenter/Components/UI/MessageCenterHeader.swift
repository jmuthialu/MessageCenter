//
//  MessageCenterHeader.swift
//  MessageCenter
//
//  Created by Jay Muthialu on 6/19/24.
//

import SwiftUI

struct MessageCenterHeader: View {
    
    var body: some View {
        Divider()
        Text("messageCenter")
            .font(FontPalette.mediumBold.font)
            .padding(.top, 10)
            .padding(.bottom, 10)
            .padding(.leading, 20)
        Divider()
    }
}

#Preview {
    MessageCenterHeader()
}
