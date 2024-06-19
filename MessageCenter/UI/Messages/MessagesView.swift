//
//  MessagesView.swift
//  MessageCenter
//
//  Created by Jay Muthialu on 6/18/24.
//

import SwiftUI

struct MessagesView: View {
    
    @ObservedObject var viewModel = MessagesViewModel(
        messagesAPI: MessagesAPI(forType: .http)
    )
    let emailString: String
    
    var body: some View {
        
        if viewModel.errorMessage.isEmpty {
            GeometryReader { geometry in
                VStack {
                    Text("messageCenter")
                        .font(FontPalette.mediumBold.font)
                        .padding(.bottom, 20)
                    
                    List {
                        ForEach(viewModel.messages, id: \.id) { message in
                            MessageRowView(message: message, width: geometry.size.width * 0.5)
                        }
                    }
                    .listStyle(.plain)
                    .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                }
                .padding()
                .task {
                    await viewModel.getMessages(forEmailID: emailString)
                }
                .refreshable {
                    await viewModel.getMessages(forEmailID: emailString)
                }
                .overlay {
                    if viewModel.showProgressView {
                        ProgressView()
                    }
                }
            } 
        } else {
            VStack {
                Text(viewModel.errorMessage)
                    .font(FontPalette.mediumBold.font)
            }
        }
    }
}

#Preview {
    MessagesView(emailString: "test@gmail.com")
}
