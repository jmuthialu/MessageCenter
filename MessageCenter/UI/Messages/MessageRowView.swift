//
//  MessageRowView.swift
//  MessageCenter
//
//  Created by Jay Muthialu on 6/18/24.
//

import SwiftUI

struct MessageRowView: View {
    let message: Message
    let width: CGFloat
    
    var body: some View {
        HStack {
            Text(message.message ?? "")
                .frame(width: width, alignment: .leading)
            
            let dateString = message.date?.toShortString()
            Text(dateString ?? "")
        }
    }
}

#Preview {
    let message = Message(name: "Test",
                          date: Date(),
                          message: "Test Message")
    MessageRowView(message: message, width: 300)
}
