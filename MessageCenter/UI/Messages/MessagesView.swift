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
        GeometryReader { geometry in
            VStack {
                Text("messageCenter")
                    .font(FontPalette.mediumBold.font)
                    .padding(.bottom, 20)
                
                List {
                    ForEach(messages, id: \.id) { message in
                        MessageRowView(message: message, width: geometry.size.width * 0.5)
                    }
                }
                .listStyle(.plain)
                .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
            }
        }
    }
}

#Preview {
    let messages: [Message] = [
        Message(name: "Test1", 
                date: Date(),
                message: "Hello, Tes1!"),
        Message(name: "Test2", 
                date: Date(),
                message: "Hello, Test2!")
    ]
    MessagesView(messages: messages)
}
