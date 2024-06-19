//
//  MessagesContainerView.swift
//  MessageCenter
//
//  Created by Jay Muthialu on 6/19/24.
//

import SwiftUI

struct MessagesContainerView: View {
    
    @ObservedObject var viewModel = MessagesViewModel(
        messagesAPI: MessagesAPI(forType: .http)
    )
    let emailString: String
    
    var body: some View {
        VStack {
            if viewModel.errorMessage.isEmpty {
                MessagesView(messages: viewModel.messages)
            } else {
                VStack {
                    Text(viewModel.errorMessage)
                        .font(FontPalette.mediumBold.font)
                        .padding()
                    
                    ThemedButton(buttonText: "Try Again") {
                        Task {
                            await viewModel.getMessages(forEmailID: emailString)
                        }
                    }
                }
            }
        }
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
}

#Preview {
    let viewModel = MessagesViewModel(messagesAPI: MessagesAPI(forType: .http))
    MessagesContainerView(viewModel: viewModel, emailString: "mtaylor@gmail.com")
}
