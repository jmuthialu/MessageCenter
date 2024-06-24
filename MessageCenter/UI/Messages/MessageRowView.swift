//
//  MessageRowView.swift
//  MessageCenter
//
//  Created by Jay Muthialu on 6/18/24.
//

import SwiftUI

struct MessageRowView: View {
    let message: Message
    
    var body: some View {
        HStack {
            Text(message.message ?? "")
                .font(FontPalette.smallRegular.font)
            
            Spacer()
            
            let dateString = message.date?.toShortString()
            Text(dateString ?? "")
                .font(FontPalette.smallRegular.font)
                .frame(width: 85)
        }
    }
}

#Preview {
    let message = Message(name: "Test",
                          date: Date(),
                          message: "The item you requested is now in stock. Please call or text customer service at 1-800-766-6786 to request shipment. Messaging and data charges may apply.")
    return MessageRowView(message: message)
}
