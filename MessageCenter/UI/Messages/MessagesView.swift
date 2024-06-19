//
//  MessagesView.swift
//  MessageCenter
//
//  Created by Jay Muthialu on 6/18/24.
//

import SwiftUI

struct MessagesView: View {
    
    let messages: [Message]
    
    var body: some View {
        GeometryReader { _ in
            VStack(alignment: .leading) {
                List {
                    ForEach(messages, id: \.id) { message in
                        MessageRowView(message: message) 
                    }
                }
                .listStyle(.plain)
                
            }
            .padding(EdgeInsets(top: 1, leading: 15, bottom: 10, trailing: 15))
        }
    }
}

#Preview {
    let messages: [Message] = [
        Message(name: "Test1", 
                date: Date(),
                message: "The item you requested is now in stock. Please call or text customer service at 1-800-766-6786 to request shipment. Messaging and data charges may apply."),
        Message(name: "Test2", 
                date: Date(),
                message: "Hello, Test2!")
    ]
    MessagesView(messages: messages)
}
